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
    
    func getError() {
        titleLabel.text = "Некорректная операция"
        titleLabel.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    }
    
    @IBAction func calculateButton(_ sender: Any) { // кнопка расчёта
        
        guard
            let action = Operator(rawValue: operationValueTextField.text ?? ""),
            let firstValue = Double(firstValueTextField.text ?? ""),
            let secondValue = Double(secondValueTextField.text ?? "") else { return getError() }
        
        enum Operator: String {
            case sum = "+"
            case sub = "-"
            case multi = "*"
            case division = "/"
            
            static func apply(_ a: Double, _ b: Double, controller: Operator) -> Double {
                switch controller {
                case .sum: return a + b
                case .sub: return a - b
                case .multi: return a * b
                case .division: return a / b
                }
            }
        }
        
        titleLabel.text = String(format: "%g", Operator.apply(firstValue, secondValue, controller: action))
    }
    
    @IBAction func resetButton(_ sender: Any) { // сброс данных
        resetFields()
        titleLabel.text = "Калькулятор"
    }
    
}
