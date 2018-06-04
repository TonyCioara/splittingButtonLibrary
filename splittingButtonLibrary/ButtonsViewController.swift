//
//  SideTpSideButtonsVC.swift
//  splittingButtonLibrary
//
//  animated by Tony Cioara on 5/15/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import UIKit

class ButtonsViewController: UIViewController, SplittingButtonDataSource, SplittingButtonDelegate {
    
    let buttonDisplayLabel = UILabel()
    
    func didTapButtonAt(button: UIButton, index: Int) {
        if index == 0 {
            self.buttonDisplayLabel.text = "Facebook button clicked"
        } else if index == 1 {
            self.buttonDisplayLabel.text = "Twitter button clicked"
        } else if index == 2 {
            self.buttonDisplayLabel.text = "Instagram button clicked"
        } else {
            self.buttonDisplayLabel.text = "Red button clicked"
        }
    }
    
    func buttonForIndexAt(index: Int) -> UIButton {
        let button = UIButton()
        
        if index == 0 {
            button.setBackgroundImage(#imageLiteral(resourceName: "facebookLogo"), for: .normal)
        } else if index == 1 {
            button.setBackgroundImage(#imageLiteral(resourceName: "twitterLogo"), for: .normal)
        } else if index == 2 {
            button.setBackgroundImage(#imageLiteral(resourceName: "instagramLogo"), for: .normal)
        } else {
            button.backgroundColor = .red
        }
        
        return button
    }
    
    func numberOfButtons() -> Int {
        return 3
    }
    
    func setUpLabel() {
        let font = UIFont(name: ".SFUIText-Medium", size: 18)!
        self.buttonDisplayLabel.font = font
        self.buttonDisplayLabel.frame = CGRect(x: 0, y: self.view.frame.height - 48, width: self.view.frame.width, height: 24)
        self.buttonDisplayLabel.textAlignment = .center
        self.view.addSubview(self.buttonDisplayLabel)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpLabel()
        
        let frame = CGRect(x: self.view.frame.midX - 20, y: self.view.frame.midY - 20, width: 40, height: 40)
        
        let splittingButton = SplittingButton(animateInCircleWithFrame: frame, target: self)
//        let splittingButton = SplittingButton(animateInDirectionWithFrame: frame, target: self, direction: .left)
//        let splittingButton = SplittingButton(animateInListWithFrame: frame, target: self, direction: .down, collums: 3)
        
        splittingButton.dataSource = self
        splittingButton.delegate = self
        splittingButton.setBackgroundImage(#imageLiteral(resourceName: "shareButton"), for: .normal)
        splittingButton.layer.cornerRadius = 5
        self.view.addSubview(splittingButton)
    }
}

