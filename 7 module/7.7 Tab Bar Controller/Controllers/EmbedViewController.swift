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
    
    @IBAction func backgroundSetButton(_ sender: UIButton) {
        
        // получаем идентификатор кнопки
        guard let isPressedButton = sender.currentTitle else { return }
        
        // передаём значение выбранного цвета
        delegate?.setBackground(getBackground(from: isPressedButton))
        
    }
    
}
