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
        switch self.rawValue {
        case 0: return UIColor.systemGreen
        case 1: return UIColor.systemBlue
        case 2: return UIColor.systemRed
        case 3: return UIColor.systemYellow
        case 4: return UIColor.systemPurple
        default: return UIColor.white
        }
    }
    
    var label: String {
        switch self.rawValue {
        case 0: return "зелёный"
        case 1: return "синий"
        case 2: return "красный"
        case 3: return "жёлтый"
        case 4: return "пурпурный"
        default: return "зелёный"
        }
    }
}
