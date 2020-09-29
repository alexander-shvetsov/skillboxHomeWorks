//
//  EmbedViewController.swift
//  7.7 Tab Bar Controller
//
//  Created by Shvetsov_AV on 23.09.2020.
//  Copyright © 2020 Alexander Shvetsov. All rights reserved.
//

import UIKit

// протокол делигата
protocol ChangeBackgroundDelegate {
    func setBackground(_ color: UIColor)
}

class EmbedViewController: UIViewController {

    var delegate: ChangeBackgroundDelegate?
    
    @IBAction func changeBackground(_ sender: UIButton) {
        
        // получаем цвет c сопоставлением: идентификатор кнопки с моделью (Model/Colors)
        guard let settedBackground = Colors(rawValue: sender.tag) else { return }
        
        /* передаём значение выбранного цвета,
        с сопоставлением идентификатора кнопки с моделью фона из (Model/Colors) */
        delegate?.setBackground(settedBackground.background)
        
    }
    
}
