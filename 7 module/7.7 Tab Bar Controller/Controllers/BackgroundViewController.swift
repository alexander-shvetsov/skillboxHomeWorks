//
//  BackgroundViewController.swift
//  7.7 Tab Bar Controller
//
//  Created by Shvetsov_AV on 23.09.2020.
//  Copyright © 2020 Alexander Shvetsov. All rights reserved.
//

import UIKit

class BackgroundViewController: UIViewController {

    private var embedVC: EmbedViewController?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? EmbedViewController else { return }
        embedVC = vc
        vc.delegate = self
    }
    
    @IBAction func changeBackground(_ sender: UIButton) {
        
        // получаем цвет c сопоставлением: идентификатор кнопки с моделью (Model/Colors)
        guard let settedBackground = Colors(rawValue: sender.tag) else { return }
        
        /* передаём значение выбранного цвета,
         с сопоставлением идентификатора кнопки с моделью фона из (Model/Colors) */
        embedVC?.view.backgroundColor = settedBackground.background
        
    }
    
}

/* расширяем класс до получения протокола делегата,
который обязует контроллер, принимать новое значение фона */
extension BackgroundViewController: ChangeBackgroundDelegate {
    func setBackground(_ color: UIColor) {
        self.view.backgroundColor = color
    }
}
