//
//  SideTpSideButtonsVC.swift
//  splittingButtonLibrary
//
//  animated by Tony Cioara on 5/15/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import UIKit

enum Direction {
    case right
    case left
    case up
    case down
}

class ButtonsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frame = CGRect(x: self.view.frame.midX - 15, y: self.view.frame.midY - 15, width: 30, height: 30)
        var buttonArray: [UIButton] = []
        
        for index in 1...14 {
            let button = UIButton()
            button.addTarget(self, action: #selector(clickedButton(sender:)), for: .touchDown)
            
            button.backgroundColor = UIColor.red
            button.setTitle(String(index), for: .normal)
            button.titleLabel?.font = UIFont(name: ".SFUIText", size: 18)!
            button.titleLabel?.textAlignment = .center
            button.titleLabel?.textColor = .white
            
            buttonArray.append(button)
        }
        
        let splittingButton = SplittingButton(frame: frame, target: self, buttonArray: buttonArray)
        splittingButton.backgroundColor = UIColor.red
        self.view.addSubview(splittingButton)
    }
    
    @objc func clickedButton(sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            sender.backgroundColor = UIColor.blue
        }
        UIView.animate(withDuration: 0.5, delay: 0.5, options: [], animations: {
            sender.backgroundColor = UIColor.red
        }, completion: nil)
    }
}

class SplittingButton: UIButton {
    
    private var buttonArray: [UIButton] = []
    private var darkView = UIView()
    private var caller: UIViewController!
    public var cancelButton: UIButton?
    
    init(frame: CGRect, target: UIViewController, buttonArray: [UIButton]) {
        super.init(frame: frame)
        self.addTarget(self, action: #selector(clicked(sender:)), for: .touchDown)
        self.buttonArray = buttonArray
        self.caller = target
        
        self.darkView.frame = self.caller.view.bounds
        self.darkView.backgroundColor = UIColor.lightGray
        self.darkView.alpha = 0.0
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func clicked(sender: UIButton) {
        
        self.isHidden = true
        
        animateDarkView()
        repositionButtonFrames()
        addButtonsToSuperView()
        
        
        setUpCancelButton()
        
        //        TODO: Change depending on state
        animateButtonsInDirection(withDirection: .down)
        
    }
    
    private func animateDarkView() {
        self.caller.view.addSubview(darkView)
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
        for button in self.self.buttonArray {
            self.caller.view.addSubview(button)
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
        caller.view.addSubview(button)
        
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
    
    private func animateButtonsInDirection(withDirection: Direction) {
        
        var xOffset: CGFloat = 0
        var yOffset: CGFloat = 0
        
        for index in 0 ..< buttonArray.count {
            
            switch withDirection {
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
    
    private func animateButtonsInList(withDirection: Direction, collums: Int) {
        
        var yOffset: CGFloat = 0
        var initialXOffset: CGFloat = 0
        
        var lines = Double(self.buttonArray.count) / Double(collums)
        lines.round(.awayFromZero)
        
        switch withDirection {
        case .down:
            initialXOffset -= self.frame.width * CGFloat(collums - 1)
        case .up:
            initialXOffset -= self.frame.width * CGFloat(collums - 1)
            yOffset -= self.frame.height * 2 * (CGFloat(lines) + 1)
        case .right:
            initialXOffset += self.frame.width * 2
            yOffset -= self.frame.height * CGFloat(lines + 1)
        case .left:
            initialXOffset -= self.frame.width * 2 * (CGFloat(collums))
            yOffset -= self.frame.height * CGFloat(lines + 1)
        }
        
        var xOffset = initialXOffset
        
        for index in 0 ..< buttonArray.count {
            
            if index % collums == 0 {
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
