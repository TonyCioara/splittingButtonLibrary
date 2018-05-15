//
//  SideTpSideButtonsVC.swift
//  splittingButtonLibrary
//
//  Created by Tony Cioara on 5/15/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import UIKit

class ButtonsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frame = CGRect(x: self.view.frame.midX - 15, y: self.view.frame.midY - 15, width: 30, height: 30)
        var buttonArray: [UIButton] = []
        
        for i in 1...8 {
            let button = UIButton(frame: frame)
            button.backgroundColor = UIColor.red
            buttonArray.append(button)
        }
        
        let splittingButton = SplittingButton(frame: frame, target: self, buttonArray: buttonArray)
        splittingButton.backgroundColor = UIColor.red
        self.view.addSubview(splittingButton)
        
        
    }
    
}

class SplittingButton: UIButton {
    
    var buttonArray: [UIButton] = []
    var darkView = UIView()
    var caller: UIViewController!
    
    init(frame: CGRect, target: UIViewController, buttonArray: [UIButton]) {
        super.init(frame: frame)
        self.addTarget(self, action: #selector(clicked(sender:)), for: .touchDown)
        self.buttonArray = buttonArray
        self.caller = target
        
        self.darkView.frame = self.caller.view.bounds
        self.darkView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func clicked(sender: UIButton) {
        
        if self.buttonArray.count == 0 || self.buttonArray.count > 10 {
            return
        }
        
        self.caller.view.addSubview(darkView)
        self.isHidden = true
        
        repositionButtonFrames()
        addButtonsToSuperView()
        
        if self.buttonArray.count == 1 {
            createOneButton()
        } else if self.buttonArray.count == 2 {
            createTwoButtons()
        } else if self.buttonArray.count == 3 {
            createThreeButtons()
        } else if self.buttonArray.count == 4 {
            createFourButtons()
        } else if self.buttonArray.count == 5 {
            createFiveButtons()
        } else if self.buttonArray.count == 6 {
            createSixButtons()
        } else if self.buttonArray.count == 7 {
            createSevenButtons()
        } else if self.buttonArray.count == 8 {
            createEightButtons()
        } else if self.buttonArray.count == 9 {
            createNineButtons()
        } else if self.buttonArray.count == 10 {
            createTenButtons()
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
    
    private func createOneButton() {
        
        UIView.animate(withDuration: 0.5) {
            self.buttonArray[0].frame = CGRect(x: self.buttonArray[0].frame.minX, y: self.buttonArray[0].frame.minY - 60, width: self.buttonArray[0].frame.width, height: self.buttonArray[0].frame.height)
        }
    }
    
    private func createTwoButtons() {
        
        UIView.animate(withDuration: 0.5) {
            self.buttonArray[0].frame = CGRect(x: self.buttonArray[0].frame.minX + 60, y: self.buttonArray[0].frame.minY, width: self.buttonArray[0].frame.width, height: self.buttonArray[0].frame.height)
            self.buttonArray[1].frame = CGRect(x: self.buttonArray[1].frame.minX - 60, y: self.buttonArray[1].frame.minY, width: self.buttonArray[1].frame.width, height: self.buttonArray[1].frame.height)
        }
    }
    
    private func createThreeButtons() {
        
        UIView.animate(withDuration: 0.5) {
            self.buttonArray[0].frame = CGRect(x: self.buttonArray[0].frame.minX, y: self.buttonArray[0].frame.minY - 60, width: self.buttonArray[0].frame.width, height: self.buttonArray[0].frame.height)
            self.buttonArray[1].frame = CGRect(x: self.buttonArray[1].frame.minX + 60, y: self.buttonArray[1].frame.minY + 40, width: self.buttonArray[1].frame.width, height: self.buttonArray[1].frame.height)
            self.buttonArray[2].frame = CGRect(x: self.buttonArray[2].frame.minX - 60, y: self.buttonArray[2].frame.minY + 40, width: self.buttonArray[2].frame.width, height: self.buttonArray[2].frame.height)
        }
    }
    
    private func createFourButtons() {
        
        UIView.animate(withDuration: 0.5) {
            self.buttonArray[0].frame = CGRect(x: self.buttonArray[0].frame.minX, y: self.buttonArray[0].frame.minY - 60, width: self.buttonArray[0].frame.width, height: self.buttonArray[0].frame.height)
            self.buttonArray[1].frame = CGRect(x: self.buttonArray[1].frame.minX + 60, y: self.buttonArray[1].frame.minY, width: self.buttonArray[1].frame.width, height: self.buttonArray[1].frame.height)
            self.buttonArray[2].frame = CGRect(x: self.buttonArray[2].frame.minX, y: self.buttonArray[2].frame.minY + 60, width: self.buttonArray[2].frame.width, height: self.buttonArray[2].frame.height)
            self.buttonArray[3].frame = CGRect(x: self.buttonArray[3].frame.minX - 60, y: self.buttonArray[3].frame.minY, width: self.buttonArray[3].frame.width, height: self.buttonArray[3].frame.height)
        }
    }
    
    private func createFiveButtons() {
        
        UIView.animate(withDuration: 0.5) {
            self.buttonArray[0].frame = CGRect(x: self.buttonArray[0].frame.minX, y: self.buttonArray[0].frame.minY - 55, width: self.buttonArray[0].frame.width, height: self.buttonArray[0].frame.height)
            self.buttonArray[1].frame = CGRect(x: self.buttonArray[1].frame.minX + 55, y: self.buttonArray[1].frame.minY - 10, width: self.buttonArray[1].frame.width, height: self.buttonArray[1].frame.height)
            self.buttonArray[2].frame = CGRect(x: self.buttonArray[2].frame.minX + 35, y: self.buttonArray[2].frame.minY + 50, width: self.buttonArray[2].frame.width, height: self.buttonArray[2].frame.height)
            self.buttonArray[3].frame = CGRect(x: self.buttonArray[3].frame.minX - 35, y: self.buttonArray[3].frame.minY + 50, width: self.buttonArray[3].frame.width, height: self.buttonArray[3].frame.height)
            self.buttonArray[4].frame = CGRect(x: self.buttonArray[4].frame.minX - 55, y: self.buttonArray[4].frame.minY - 10, width: self.buttonArray[4].frame.width, height: self.buttonArray[4].frame.height)
        }
    }
    
    private func createSixButtons() {
        
        UIView.animate(withDuration: 0.5) {
            self.buttonArray[0].frame = CGRect(x: self.buttonArray[0].frame.minX, y: self.buttonArray[0].frame.minY - 60, width: self.buttonArray[0].frame.width, height: self.buttonArray[0].frame.height)
            self.buttonArray[1].frame = CGRect(x: self.buttonArray[1].frame.minX + 60, y: self.buttonArray[1].frame.minY - 30, width: self.buttonArray[1].frame.width, height: self.buttonArray[1].frame.height)
            self.buttonArray[2].frame = CGRect(x: self.buttonArray[2].frame.minX + 60, y: self.buttonArray[2].frame.minY + 30, width: self.buttonArray[2].frame.width, height: self.buttonArray[2].frame.height)
            self.buttonArray[3].frame = CGRect(x: self.buttonArray[3].frame.minX, y: self.buttonArray[3].frame.minY + 60, width: self.buttonArray[3].frame.width, height: self.buttonArray[3].frame.height)
            self.buttonArray[4].frame = CGRect(x: self.buttonArray[4].frame.minX - 60, y: self.buttonArray[4].frame.minY + 30, width: self.buttonArray[4].frame.width, height: self.buttonArray[4].frame.height)
            self.buttonArray[5].frame = CGRect(x: self.buttonArray[5].frame.minX - 60, y: self.buttonArray[5].frame.minY - 30, width: self.buttonArray[5].frame.width, height: self.buttonArray[5].frame.height)
        }
        
    }
    
    private func createSevenButtons() {
    }
    
    private func createEightButtons() {
        
        UIView.animate(withDuration: 0.5) {
            self.buttonArray[0].frame = CGRect(x: self.buttonArray[0].frame.minX, y: self.buttonArray[0].frame.minY - 60, width: self.buttonArray[0].frame.width, height: self.buttonArray[0].frame.height)
            self.buttonArray[1].frame = CGRect(x: self.buttonArray[1].frame.minX + 50, y: self.buttonArray[1].frame.minY - 50, width: self.buttonArray[1].frame.width, height: self.buttonArray[1].frame.height)
            self.buttonArray[2].frame = CGRect(x: self.buttonArray[2].frame.minX + 60, y: self.buttonArray[2].frame.minY, width: self.buttonArray[2].frame.width, height: self.buttonArray[2].frame.height)
            self.buttonArray[3].frame = CGRect(x: self.buttonArray[3].frame.minX + 50, y: self.buttonArray[3].frame.minY + 50, width: self.buttonArray[3].frame.width, height: self.buttonArray[3].frame.height)
            self.buttonArray[4].frame = CGRect(x: self.buttonArray[4].frame.minX, y: self.buttonArray[4].frame.minY + 60, width: self.buttonArray[4].frame.width, height: self.buttonArray[4].frame.height)
            self.buttonArray[5].frame = CGRect(x: self.buttonArray[5].frame.minX - 50, y: self.buttonArray[5].frame.minY + 50, width: self.buttonArray[5].frame.width, height: self.buttonArray[5].frame.height)
            self.buttonArray[6].frame = CGRect(x: self.buttonArray[6].frame.minX - 60, y: self.buttonArray[6].frame.minY, width: self.buttonArray[6].frame.width, height: self.buttonArray[6].frame.height)
            self.buttonArray[7].frame = CGRect(x: self.buttonArray[7].frame.minX - 50, y: self.buttonArray[7].frame.minY - 50, width: self.buttonArray[7].frame.width, height: self.buttonArray[7].frame.height)
        }
    }
    
    private func createNineButtons() {
    }
    
    private func createTenButtons() {
    }
}
