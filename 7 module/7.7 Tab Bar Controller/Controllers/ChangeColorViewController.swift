//
//  ChangeColorViewController.swift
//  7.7 Tab Bar Controller
//
//  Created by Shvetsov_AV on 22.09.2020.
//  Copyright © 2020 Alexander Shvetsov. All rights reserved.
//

import UIKit

// протокол делигата
protocol ChangeColorVCDelegate {
    func setColor(_ color: String)
}

class ChangeColorViewController: UIViewController {
    
    var settedColor = "" // temp value
    var delegate: ChangeColorVCDelegate? // объявление делигата
    
    @IBOutlet weak var colorTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorTextField.text = settedColor
    }

    @IBAction func changeColor(_ sender: UIButton) {
        
        /* получаем значение с сопоставлением:
         идентификатор кнопки с моделью (Model/Colors) */
        guard let choiseColor = Colors(rawValue: sender.tag) else { return }
        
        /* присваиваем новое значение цвета, с сопоставлением в модели (Model/Colors),
         относительно идентификатора кнопки */
        settedColor = "Выбран \(choiseColor.label)"
        
        // передаём значение выбранного цвета
        delegate?.setColor(settedColor)
        
        dismiss(animated: true) // close
    }
    
}
