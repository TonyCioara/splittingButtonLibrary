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
        
        button.backgroundColor = UIColor.red
//        button.setTitle(String(index), for: .normal)
//        button.titleLabel?.font = UIFont(name: ".SFUIText", size: 18)!
//        button.titleLabel?.textAlignment = .center
//        button.titleLabel?.textColor = .white
        return button
    }
    
    func numberOfButtons() -> Int {
        return 6
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frame = CGRect(x: self.view.frame.midX - 15, y: self.view.frame.midY - 15, width: 30, height: 30)
        
        let splittingButton = SplittingButton(frame: frame, target: self, animateInCircle: true)
        splittingButton.dataSource = self
        splittingButton.delegate = self
        splittingButton.backgroundColor = UIColor.red
        self.view.addSubview(splittingButton)
    }
}

