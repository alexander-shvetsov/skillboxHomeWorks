//
//  Colors.swift
//  7.7 Tab Bar Controller
//
//  Created by Shvetsov_AV on 22.09.2020.
//  Copyright © 2020 Alexander Shvetsov. All rights reserved.
//

import UIKit

enum Colors: String {
    case green = "Выбрать зелёный"
    case red = "Выбрать красный"
    case blue = "Выбрать синий"
}

// метод сопоставления
func getColor(from buttonName: String) -> String {
    
    guard let colorType = Colors(rawValue: buttonName) else {
        return "Выбран зелёный"
    }
    
    switch colorType {
    case .green: return "Выбран зелёный"
    case .red: return "Выбран красный"
    case .blue: return "Выбран синий"
    }
    
}
