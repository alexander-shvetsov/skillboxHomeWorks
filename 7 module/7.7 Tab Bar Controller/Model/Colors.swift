//
//  Colors.swift
//  7.7 Tab Bar Controller
//
//  Created by Shvetsov_AV on 22.09.2020.
//  Copyright © 2020 Alexander Shvetsov. All rights reserved.
//

import UIKit

enum Colors: Int {
    case green = 0
    case blue = 1
    case red = 2
    case yellow = 3
    case purple = 4
    
    var background: UIColor {
        switch self {
        case .green: return UIColor.systemGreen
        case .blue: return UIColor.systemBlue
        case .red: return UIColor.systemRed
        case .yellow: return UIColor.systemYellow
        case .purple: return UIColor.systemPurple
        }
    }
    
    var label: String {
        switch self {
        case .green: return "Выбран зелёный"
        case .blue: return "Выбран синий"
        case .red: return "Выбран красный"
        case .yellow: return "Выбран жёлтый"
        case .purple: return "Выбран пурпурный"
        }
    }
}
