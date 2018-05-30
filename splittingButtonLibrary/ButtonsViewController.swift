//
//  SideTpSideButtonsVC.swift
//  splittingButtonLibrary
//
//  animated by Tony Cioara on 5/15/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import UIKit

class ButtonsViewController: UIViewController, SplittingButtonDataSource, SplittingButtonDelegate {
    
    func didTapButtonAt(index: Int) {
        return
    }
    
    func buttonForIndexAt(index: Int) -> UIButton {
        let button = UIButton()
        button.addTarget(self, action: #selector(clickedButton(sender:)), for: .touchDown)
        
        button.backgroundColor = UIColor.red
//        button.setTitle(String(index), for: .normal)
//        button.titleLabel?.font = UIFont(name: ".SFUIText", size: 18)!
//        button.titleLabel?.textAlignment = .center
//        button.titleLabel?.textColor = .white
        return button
    }
    
    func numberOfButtons() -> Int {
        return 7
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
    
    @objc func clickedButton(sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            sender.backgroundColor = UIColor.blue
        }
        UIView.animate(withDuration: 0.5, delay: 0.5, options: [], animations: {
            sender.backgroundColor = UIColor.red
        }, completion: nil)
    }
}

