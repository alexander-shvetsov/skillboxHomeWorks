//
//  ViewController.swift
//  6.2-learnProject
//
//  Created by Shvetsov_AV on 12.09.2020.
//  Copyright © 2020 Alexander Shvetsov. All rights reserved.
//

// MARK: Задача
/*
 Для этой задачи будет нужно сделать три текстовых поля.
 По сути это аналог калькулятора :)
 - в первое поле вводится целое число,
 - во второе — оператор (минус, плюс, умножить, делить),
 - в третье поле — второе число.
 При нажатии на кнопку операция из второго поля применяется к числу из первого и третьего поля. Если где-то введены некорректные данные, в лейбл должно вывестись «Некорректные данные».
 */

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
    }
    
    func calculate() { // калькулятор
        
        let firstField = firstValueTextField.text
        let secondField = secondValueTextField.text
        let operatorField = operationValueTextField.text
        
        guard firstField?.isEmpty == false, secondField?.isEmpty == false, operatorField?.isEmpty == false else { // защита
            return titleLabel.text = "Некорректная операция"
        }
        
        if let firstValue = Double(firstField ?? ""), let secondValue = Double(secondField ?? "") { // извлечение Double
            
            switch operatorField { // логика
            case "+":
                titleLabel.text = String(format:"%g", firstValue + secondValue)
                resetFields()
            case "-":
                titleLabel.text = String(format:"%g", firstValue - secondValue)
                resetFields()
            case "*":
                titleLabel.text = String(format:"%g", firstValue * secondValue)
                resetFields()
            case "/":
                titleLabel.text = String(format:"%g", firstValue / secondValue)
                resetFields()
            default:
                titleLabel.text = "Некорректная операция"
            }
            
        }
        
    }
    
    @IBAction func calculateButton(_ sender: UIButton) { // кнопка расчёта
        calculate()
    }
    
    @IBAction func resetButton(_ sender: UIButton) { // сброс данных
        resetFields()
        titleLabel.text = "Калькулятор"
    }
    
}
