//
//  ViewController.swift
//  calculator
//
//  Created by Shvetsov_AV on 24.09.2020.
//  Copyright © 2020 Alexander Shvetsov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var valueLabel: UILabel!

    var isTyping = false
    var firstOperand: Double = 0
    var secondOperand: Double = 0

    // переменная для работы с операндами
    var currentInput: Double {
        get {
            return Double(valueLabel.text!) ?? 0
        }
        set(value) {
            // получаем целое число (откидываем 0, когда это возможно)
            let array = "\(value)"
            let valueIsArray = array.components(separatedBy: ".")
            if valueIsArray[1] == "0" {
                valueLabel.text = "\(valueIsArray[0])"
            } else {
                valueLabel.text = "\(value)"
            }
            isTyping = false
        }
    }

    // идентификатор кнопки оператора
    var operatorId = ""

    // идентификатор, поставлен ли разделитель числа
    var dotIsPlaced = false

    @IBAction func numberButtons(_ sender: UIButton) {

        guard let sendingButton = sender as? UIButton else { return } // как подсказывает swiftlint, возможно это лишнее
        let button = sendingButton.tag

        if isTyping {                           // условие продолжения ввода
            valueLabel.text! += String(button)
        } else {                                // условие начального ввода
            valueLabel.text! = String(button)
            isTyping = true
        }

    }
    
    @IBAction func dotButton() {
        if isTyping && !dotIsPlaced {
            valueLabel.text! += "."
            dotIsPlaced = true
        } else if !isTyping && !dotIsPlaced {
            valueLabel.text = "0."
        }
    }
    
    @IBAction func operationButtons(_ sender: UIButton) {
        // получаем идентификатор кнопки оператора
        let operatorButton = Operator(rawValue: sender.tag)
        guard let operatorValue = operatorButton?.value else { return }
        operatorId = operatorValue

        // сохраняем первый операнд
        firstOperand = currentInput
        isTyping = false

        // даём возможность указания разделителя числа
        dotIsPlaced = false
    }
    
    @IBAction func plusMinusButton() {
        currentInput = -currentInput
    }

    @IBAction func percentButton() {
        if firstOperand == 0 {
            currentInput /= 100
        } else {
            secondOperand = firstOperand * currentInput / 100
        }

        isTyping = false
    }

    @IBAction func equalButton() {
        // сохраняем второй операнд
        if isTyping {
            secondOperand = currentInput
        }

        // calculator logic
        switch operatorId {
        case "+": getResult{$0 + $1}
        case "-": getResult{$0 - $1}
        case "*": getResult{$0 * $1}
        case "/": getResult{$0 / $1}
        default: break
        }

        // даём возможность указания разделителя числа
        dotIsPlaced = false
    }

    @IBAction func clearButton() {
        firstOperand = 0
        secondOperand = 0
        currentInput = 0
        valueLabel.text = "0"
        isTyping = false
        dotIsPlaced = false
        operatorId = ""
    }

    // calculator logic
    func getResult(operation: (Double, Double) -> Double) {
        currentInput = operation(firstOperand, secondOperand)
        isTyping = false
    }

    enum Operator: Int { // sender.tags
        case add = 11
        case sub = 12
        case multi = 13
        case divide = 14

        var value: String { // unwrap tags
            switch self {
            case .add: return "+"
            case .sub: return "-"
            case .multi: return "*"
            case .divide: return "/"
            }
        }
    }
}

/*  Или
 func calc(n1: Double, n2: Double, operation: (Double, Double) -> Double) -> Double {
     return operation(n1, n2)
 }

 let calcResult = calc(n1: value, n2: value) {$0 * $1}
 */

/*
 button tags:
 dot = 10
 + = 11
 - = 12
 × = 13
 ÷ = 14
 equally = 15
 AC = 16
 +/- = 17
 % = 18
 */
