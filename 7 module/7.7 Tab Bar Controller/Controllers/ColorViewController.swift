//
//  ColorViewController.swift
//  7.7 Tab Bar Controller
//
//  Created by Shvetsov_AV on 22.09.2020.
//  Copyright © 2020 Alexander Shvetsov. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {
    
    var titleValue = "Выбран зелёный" // default value
    
    @IBOutlet weak var titleLabel: UILabel!
    
    /* объявляем, что если мы переходим на экран выбора цвета, передаём ему title,
     наследуем новое значение тайтла, при выборе нового цвета */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let changeColorVC = segue.destination as? ChangeColorViewController else { return }
        changeColorVC.settedColor = titleLabel.text!
        changeColorVC.delegate = self
    }
    
}

/* расширяем класс до получения протокола делегата,
 который обязует контроллер, получить новое значение тайтла */
extension ColorViewController: ChangeColorVCDelegate {
    func setColor(_ color: String) {
        titleLabel.text = color
    }
}
