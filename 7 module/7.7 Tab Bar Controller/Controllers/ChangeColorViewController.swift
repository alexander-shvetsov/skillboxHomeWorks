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

    @IBAction func buttonPressed(_ sender: UIButton) {
        
        // получаем идентификатор кнопки
        guard let choiseColor = sender.currentTitle else { return }
        
        /* применяем метод сопоставления из модели (Model/Colors),
         относительно полученного идентификатора кнопки */
        settedColor = getColor(from: choiseColor)
        
        // передаём значение выбранного цвета
        delegate?.setColor(settedColor)
        
        dismiss(animated: true, completion: nil) // close
    }
    
}
