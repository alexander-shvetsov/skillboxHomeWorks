//
//  ViewController.swift
//  6.2-learnProject
//
//  Created by Shvetsov_AV on 12.09.2020.
//  Copyright © 2020 Alexander Shvetsov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var firstValueTextField: UITextField!
    @IBOutlet weak var operationValueTextField: UITextField!
    @IBOutlet weak var secondValueTextField: UITextField!
    
    func resetFields() { // сброс полей ввода
        firstValueTextField.text = ""
        operationValueTextField.text = ""
        secondValueTextField.text = ""
        titleLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    }
    
    func showError() {
        titleLabel.text = "Некорректная операция"
        titleLabel.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    }
    
    @IBAction func calculateButton() {
        
        guard
            // unwrap values from fields
            let firstValue = Double(firstValueTextField.text ?? ""),
            let secondValue = Double(secondValueTextField.text ?? ""),
            // get data from Model
            let calcSum = Operator(rawValue: "+"),
            let calcSub = Operator(rawValue: "-"),
            let calcMulti = Operator(rawValue: "*"),
            let calcDiv = Operator(rawValue: "/") else { return showError() }
        
        switch operationValueTextField.text {
        case "+": return titleLabel.text = String(format: "%g", calcSum.apply(firstValue, secondValue))
        case "-": return titleLabel.text = String(format: "%g", calcSub.apply(firstValue, secondValue))
        case "*": return titleLabel.text = String(format: "%g", calcMulti.apply(firstValue, secondValue))
        case "/": return titleLabel.text = String(format: "%g", calcDiv.apply(firstValue, secondValue))
        default: showError()
        }
        
    }
    
    @IBAction func resetButton() { // сброс данных
        resetFields()
        titleLabel.text = "Калькулятор"
    }
    
}
