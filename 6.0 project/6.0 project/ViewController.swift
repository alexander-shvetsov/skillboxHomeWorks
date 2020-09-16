//
//  ViewController.swift
//  6.0 project
//
//  Created by Shvetsov_AV on 11.09.2020.
//  Copyright © 2020 Alexander Shvetsov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    var names = [String]() // array of peoples

    @IBAction func sendButton(_ sender: UIButton) {
        if let name = nameTextField.text, !name.isEmpty { // check
            names.append(name) // add name
            helloLabel.text = "Привет, \(names.joined(separator: " "))" // format
            nameTextField.text = "" // reset input
        }
    }
    
    @IBAction func resetButton(_ sender: UIButton) { // clear
        nameTextField.text = ""
        helloLabel.text = "Привет! Как тебя зовут?"
        names = [String]()
    }
    
}

