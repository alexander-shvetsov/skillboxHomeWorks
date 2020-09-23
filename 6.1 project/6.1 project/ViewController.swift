//
//  ViewController.swift
//  6.1 project
//
//  Created by Shvetsov_AV on 11.09.2020.
//  Copyright © 2020 Alexander Shvetsov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var numberField: UITextField!
    
    func showError() {
        titleLabel.text = "Введите целое число в строку"
        titleLabel.textColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        numberField.text = ""
    }
    
    func reset() {
        numberField.text = ""
        titleLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    }
    
    @IBAction func calculateButton() {
        
        guard let value = Double(numberField.text ?? "") else { return showError() }
        titleLabel.text = String(format: "%g", pow(value, 2))
        reset()
        
    }
    
}

