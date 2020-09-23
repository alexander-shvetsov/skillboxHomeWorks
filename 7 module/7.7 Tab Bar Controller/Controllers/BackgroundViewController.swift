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
    
    @IBAction func backgroundSetButton(_ sender: UIButton) {
        
        // получаем идентификатор кнопки
        guard let isPressedButton = sender.currentTitle else { return }
        
        /* применяем метод сопоставления из модели (Model/Background),
        относительно полученного идентификатора кнопки */
        embedVC?.view.backgroundColor = getBackground(from: isPressedButton)
        
    }
    
}

/* расширяем класс до получения протокола делегата,
который обязует контроллер, принимать новое значение фона */
extension BackgroundViewController: ChangeBackgroundDelegate {
    func setBackground(_ color: UIColor) {
        self.view.backgroundColor = color
    }
}
