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
        switch self {
        case .sum: return a + b
        case .sub: return a - b
        case .multi: return a * b
        case .division: return a / b
        }
    }
}
