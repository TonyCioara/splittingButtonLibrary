//
//  ViewController.swift
//  splittingButtonLibrary
//
//  Created by Tony Cioara on 5/10/18.
//  Copyright © 2018 Tony Cioara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let buttonCount = 4
    var buttonArray: [UIButton] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addSplittingButtontoView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addSplittingButtontoView() {
        
        let button = UIButton(frame: CGRect(x: self.view.frame.width / 2 - 20, y: self.view.frame.height / 2 - 20, width: 40, height: 40))
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(clickedMainButton), for: .touchDown)
        button.layer.cornerRadius = 15
        self.view.addSubview(button)
    }

    @objc func clickedMainButton(sender: UIButton) {
        
        createButtons(count: buttonCount, button: sender)
    }
    
    func createButtons(count: Int, button: UIButton) {
        
        button.isHidden = true
        let frame = button.frame
        if count == 2 {
            create2Buttons(frame: frame)
        } else if count == 3 {
            create3Buttons(frame: frame)
        } else if count == 4 {
            create4Buttons(frame: frame)
        } else if count == 6 {
            create6Buttons(frame: frame)
        }
    }
    
    private func create6Buttons(frame: CGRect) {
        
        for i in 0...5 {
            let newButton = UIButton(frame: CGRect(x: self.view.frame.width / 2 - 20, y: self.view.frame.height / 2 - 20, width: 40, height: 40))
            newButton.backgroundColor = .red
            
            newButton.layer.cornerRadius = 15
            self.view.addSubview(newButton)
            
            if i == 0 {
                UIView.animate(withDuration: 0.5) {
                    newButton.frame = CGRect(x: newButton.frame.minX, y: newButton.frame.minY - 60, width: newButton.frame.width, height: newButton.frame.height)
                }
            } else if i == 1 {
                UIView.animate(withDuration: 0.5) {
                    newButton.frame = CGRect(x: newButton.frame.minX + 60, y: newButton.frame.minY - 30, width: newButton.frame.width, height: newButton.frame.height)
                }
            } else if i == 2 {
                UIView.animate(withDuration: 0.5) {
                    newButton.frame = CGRect(x: newButton.frame.minX + 60, y: newButton.frame.minY + 30, width: newButton.frame.width, height: newButton.frame.height)
                }
            } else if i == 3 {
                UIView.animate(withDuration: 0.5) {
                    newButton.frame = CGRect(x: newButton.frame.minX, y: newButton.frame.minY + 60, width: newButton.frame.width, height: newButton.frame.height)
                }
            } else if i == 4 {
                UIView.animate(withDuration: 0.5) {
                    newButton.frame = CGRect(x: newButton.frame.minX - 60, y: newButton.frame.minY + 30, width: newButton.frame.width, height: newButton.frame.height)
                }
            } else if i == 5 {
                UIView.animate(withDuration: 0.5) {
                    newButton.frame = CGRect(x: newButton.frame.minX - 60, y: newButton.frame.minY - 30, width: newButton.frame.width, height: newButton.frame.height)
                }
            }
        }
    }
    
    private func create4Buttons(frame: CGRect) {
        
        for i in 0...3 {
            let newButton = UIButton(frame: CGRect(x: self.view.frame.width / 2 - 20, y: self.view.frame.height / 2 - 20, width: 40, height: 40))
            newButton.backgroundColor = .red
            
            newButton.layer.cornerRadius = 15
            self.view.addSubview(newButton)
            
            buttonArray.append(newButton)
            
            if i == 0 {
                UIView.animate(withDuration: 0.5) {
                    newButton.frame = CGRect(x: newButton.frame.minX, y: newButton.frame.minY - 60, width: newButton.frame.width, height: newButton.frame.height)
                }
            } else if i == 1 {
                UIView.animate(withDuration: 0.5) {
                    newButton.frame = CGRect(x: newButton.frame.minX + 60, y: newButton.frame.minY, width: newButton.frame.width, height: newButton.frame.height)
                }
            } else if i == 2 {
                UIView.animate(withDuration: 0.5) {
                    newButton.frame = CGRect(x: newButton.frame.minX, y: newButton.frame.minY + 60, width: newButton.frame.width, height: newButton.frame.height)
                }
            } else if i == 3 {
                UIView.animate(withDuration: 0.5) {
                    newButton.frame = CGRect(x: newButton.frame.minX - 60, y: newButton.frame.minY, width: newButton.frame.width, height: newButton.frame.height)
                }
            }
        }
    }
    
    private func create3Buttons(frame: CGRect) {
        
        for i in 0...2 {
            
            let newButton = UIButton(frame: CGRect(x: self.view.frame.width / 2 - 20, y: self.view.frame.height / 2 - 20, width: 40, height: 40))
            newButton.backgroundColor = .red
            
            newButton.layer.cornerRadius = 15
            self.view.addSubview(newButton)
            
            buttonArray.append(newButton)
            
            if i == 0 {
                UIView.animate(withDuration: 0.5) {
                    newButton.frame = CGRect(x: newButton.frame.minX, y: newButton.frame.minY - 60, width: newButton.frame.width, height: newButton.frame.height)
                }
            } else if i == 1 {
                UIView.animate(withDuration: 0.5) {
                    newButton.frame = CGRect(x: newButton.frame.minX + 60, y: newButton.frame.minY + 40, width: newButton.frame.width, height: newButton.frame.height)
                }
            } else if i == 2 {
                UIView.animate(withDuration: 0.5) {
                    newButton.frame = CGRect(x: newButton.frame.minX - 60, y: newButton.frame.minY + 40, width: newButton.frame.width, height: newButton.frame.height)
                }
            }
        }
    }
    
    private func create2Buttons(frame: CGRect) {
        
        for i in 0...1 {
            
            let newButton = UIButton(frame: CGRect(x: self.view.frame.width / 2 - 20, y: self.view.frame.height / 2 - 20, width: 40, height: 40))
            newButton.backgroundColor = .red
            
            newButton.layer.cornerRadius = 15
            self.view.addSubview(newButton)
            
            buttonArray.append(newButton)
            
            if i == 0 {
                UIView.animate(withDuration: 0.5) {
                    newButton.frame = CGRect(x: newButton.frame.minX + 60, y: newButton.frame.minY, width: newButton.frame.width, height: newButton.frame.height)
                }
            } else if i == 1 {
                UIView.animate(withDuration: 0.5) {
                    newButton.frame = CGRect(x: newButton.frame.minX - 60, y: newButton.frame.minY, width: newButton.frame.width, height: newButton.frame.height)
                }
            }
        }
    }
    

}

