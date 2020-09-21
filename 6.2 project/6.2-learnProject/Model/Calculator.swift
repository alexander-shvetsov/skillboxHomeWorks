//
//  Calculator.swift
//  6.2-learnProject
//
//  Created by Shvetsov_AV on 21.09.2020.
//  Copyright © 2020 Alexander Shvetsov. All rights reserved.
//

import UIKit

enum Operator: String {
    case sum = "+"
    case sub = "-"
    case multi = "*"
    case division = "/"
    
    func apply(_ a: Double, _ b: Double) -> Double {
        switch self.rawValue {
        case "+": return a + b
        case "-": return a - b
        case "*": return a * b
        case "/": return a / b
        default: return 0
        }
    }
}
