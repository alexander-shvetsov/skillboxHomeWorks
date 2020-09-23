//
//  Background.swift
//  7.7 Tab Bar Controller
//
//  Created by Shvetsov_AV on 23.09.2020.
//  Copyright © 2020 Alexander Shvetsov. All rights reserved.
//

import UIKit

enum Background: String {
    case green = "Зелёный"
    case yellow = "Жёлтый"
    case purple = "Пурпурный"
}

// метод сопоставления
func getBackground(from buttonName: String) -> UIColor {
    
    guard let buttonType = Background(rawValue: buttonName) else {
        return UIColor.systemRed
    }
    
    switch buttonType {
    case .green: return UIColor.systemGreen
    case .yellow: return UIColor.systemYellow
    case .purple: return UIColor.systemPurple
    }
    
}
