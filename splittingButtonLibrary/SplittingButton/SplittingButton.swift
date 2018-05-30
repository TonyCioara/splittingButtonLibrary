//
//  SplittingButton.swift
//  splittingButtonLibrary
//
//  Created by Tony Cioara on 5/29/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import UIKit

enum Direction {
    case right
    case left
    case up
    case down
}

enum DisplayMode {
    case circle
    case list
    case direction
}

protocol SplittingButtonDataSource {
    func buttonForIndexAt(index: Int) -> UIButton
    func numberOfButtons() -> Int
}

protocol SplittingButtonDelegate {
    func didTapButtonAt(button: UIButton, index: Int)
}

class SplittingButton: UIButton {
    
    private var buttonArray: [UIButton] = []
    private var darkView = UIView()
    
    private var displayMode: DisplayMode?
    private var direction: Direction?
    private var collums: Int?
    
    public var cancelButton: UIButton?
    
    private var target: UIViewController!
    
    public var dataSource: SplittingButtonDataSource! {
        didSet {
            buttonArray = []
            for index in 0 ..< self.dataSource.numberOfButtons() {
                let button = self.dataSource.buttonForIndexAt(index: index)
                button.tag = index
                buttonArray.append(button)
            }
            
            if self.delegate != nil {
                for button in buttonArray {
                    button.addTarget(self, action: #selector(tappedSubButton(sender:)), for: .touchDown)
                }
            }
        }
        
    }
    
    public var delegate: SplittingButtonDelegate? {
        didSet {
            for button in buttonArray {
                button.addTarget(self, action: #selector(tappedSubButton(sender:)), for: .touchDown)
            }
        }
    }
    
    private init(frame: CGRect, target: UIViewController) {
        super.init(frame: frame)
        self.addTarget(self, action: #selector(clicked(sender:)), for: .touchDown)
        
        self.target = target
        
        self.darkView.frame = self.target.view.bounds
        self.darkView.backgroundColor = UIColor.lightGray
        self.darkView.alpha = 0.0
    }
    
    convenience init(frame: CGRect, target: UIViewController, animateInCircle: Bool) {
        self.init(frame: frame, target: target)
        
        self.displayMode = DisplayMode.circle
    }
    
    convenience init(frame: CGRect, target: UIViewController, animateInDirection: Direction) {
        self.init(frame: frame, target: target)
        
        self.displayMode = DisplayMode.direction
        self.direction = animateInDirection
    }
    
    convenience init(frame: CGRect, target: UIViewController, animateInListWithDirection: Direction, collums: Int) {
        self.init(frame: frame, target: target)
        
        self.displayMode = DisplayMode.list
        self.direction = animateInListWithDirection
        self.collums = collums
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tappedSubButton(sender: UIButton) {
        
        self.delegate?.didTapButtonAt(button: sender, index: sender.tag)
    }
    
    @objc func clicked(sender: UIButton) {
        
        self.isHidden = true
        
        animateDarkView()
        repositionButtonFrames()
        addButtonsToSuperView()
        setUpCancelButton()
        
        //        TODO: Change depending on state
        switch displayMode! {
        case .circle:
            animateButtonsInCircle()
        case .direction:
            animateButtonsInDirection()
        case .list:
            animateButtonsInList()
        }
    }
    
    private func animateDarkView() {
        self.target.view.addSubview(darkView)
        UIView.animate(withDuration: 0.5) {
            self.darkView.alpha = 0.5
        }
    }
    
    private func repositionButtonFrames() {
        for button in self.self.buttonArray {
            button.frame = CGRect(x: self.frame.minX, y: self.frame.minY, width: self.frame.width, height: self.frame.height)
        }
    }
    
    private func addButtonsToSuperView() {
        for button in buttonArray {
            self.target.view.addSubview(button)
        }
    }
    
    private func setUpCancelButton() {
        var button = UIButton(frame: self.frame)
        if self.cancelButton != nil {
            button = self.cancelButton!
        } else {
            button.setBackgroundImage(#imageLiteral(resourceName: "cancelButton"), for: UIControlState())
            button.addTarget(self, action: #selector(cancelButtonPressed(sender:)), for: .touchDown)
            button.alpha = 0.0
        }
        self.target.view.addSubview(button)
        
        UIView.animate(withDuration: 0.75) {
            button.alpha = 1.0
        }
    }
    
    @objc func cancelButtonPressed(sender: UIButton) {
        UIView.animate(withDuration: 0.5, animations: {
            self.darkView.alpha = 0.0
        }) { (true) in
            self.darkView.removeFromSuperview()
            self.isHidden = false
        }
        
        for button in buttonArray {
            UIView.animate(withDuration: 0.5, animations: {
                button.frame = self.frame
            }) { (true) in
                button.removeFromSuperview()
            }
        }
        sender.removeFromSuperview()
    }
    
    //    AnimateButtons
    private func animateButtonsInCircle() {
        
        var radius: CGFloat
        if self.frame.width > self.frame.height {
            radius = self.frame.width * 2
        } else {
            radius = self.frame.height * 2
        }
        
        let increment = 2 * CGFloat.pi / CGFloat(buttonArray.count)
        
        for index in 0 ..< buttonArray.count {
            
            let xPos = sin(increment * CGFloat(index)) * radius + self.frame.midX - buttonArray[index].frame.width / 2
            let yPos = cos(increment * CGFloat(index)) * (0 - radius) + self.frame.midY - buttonArray[index].frame.height / 2
            
            UIView.animate(withDuration: 0.5) {
                self.buttonArray[index].frame = CGRect(x: xPos, y: yPos, width: self.buttonArray[0].frame.width, height: self.buttonArray[0].frame.height)
            }
        }
    }
    
    private func animateButtonsInDirection() {
        
        var xOffset: CGFloat = 0
        var yOffset: CGFloat = 0
        
        for index in 0 ..< buttonArray.count {
            
            switch direction! {
            case .down:
                yOffset += self.frame.height * 2
            case .up:
                yOffset -= self.frame.height * 2
            case .right:
                xOffset += self.frame.width * 2
            case .left:
                xOffset -= self.frame.width * 2
            }
            
            UIView.animate(withDuration: 0.5) {
                self.buttonArray[index].frame = CGRect(x: self.frame.minX + xOffset, y: self.frame.minY + yOffset, width: self.buttonArray[0].frame.width, height: self.buttonArray[0].frame.height)
            }
        }
    }
    
    private func animateButtonsInList() {
        
        var yOffset: CGFloat = 0
        var initialXOffset: CGFloat = 0
        
        var lines = Double(self.buttonArray.count) / Double(collums!)
        lines.round(.awayFromZero)
        
        switch direction! {
        case .down:
            initialXOffset -= self.frame.width * CGFloat(collums! - 1)
        case .up:
            initialXOffset -= self.frame.width * CGFloat(collums! - 1)
            yOffset -= self.frame.height * 2 * (CGFloat(lines) + 1)
        case .right:
            initialXOffset += self.frame.width * 2
            yOffset -= self.frame.height * CGFloat(lines + 1)
        case .left:
            initialXOffset -= self.frame.width * 2 * (CGFloat(collums!))
            yOffset -= self.frame.height * CGFloat(lines + 1)
        }
        
        var xOffset = initialXOffset
        
        for index in 0 ..< buttonArray.count {
            
            if index % collums! == 0 {
                xOffset = initialXOffset
                yOffset += self.frame.height * 2
            } else {
                xOffset += self.frame.width * 2
            }
            
            UIView.animate(withDuration: 0.5) {
                self.buttonArray[index].frame = CGRect(x: self.frame.minX + xOffset, y: self.frame.minY + yOffset, width: self.buttonArray[0].frame.width, height: self.buttonArray[0].frame.height)
            }
        }
    }
}
