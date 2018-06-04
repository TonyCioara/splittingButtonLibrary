//
//  SideTpSideButtonsVC.swift
//  splittingButtonLibrary
//
//  animated by Tony Cioara on 5/15/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import UIKit

class ButtonsViewController: UIViewController, SplittingButtonDataSource, SplittingButtonDelegate {
    
    func didTapButtonAt(button: UIButton, index: Int) {
        UIView.animate(withDuration: 0.5) {
            button.backgroundColor = UIColor.blue
        }
        UIView.animate(withDuration: 0.5, delay: 0.5, options: [], animations: {
            button.backgroundColor = UIColor.red
        }, completion: nil)
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frame = CGRect(x: self.view.frame.midX - 20, y: self.view.frame.midY - 20, width: 40, height: 40)
        
        let splittingButton = SplittingButton(frame: frame, target: self, animateInCircle: true)
        splittingButton.dataSource = self
        splittingButton.delegate = self
        splittingButton.setBackgroundImage(#imageLiteral(resourceName: "shareButton"), for: .normal)
        splittingButton.layer.cornerRadius = 5
        self.view.addSubview(splittingButton)
    }
}

