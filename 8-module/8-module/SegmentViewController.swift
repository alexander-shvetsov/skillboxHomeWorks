//
//  SegmentViewController.swift
//  8-module
//
//  Created by Shvetsov_AV on 26.02.2021.
//

import UIKit

class SegmentViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!

    let segmentTextFields = [
        UITextField(frame: CGRect(x: 20, y: 150, width: 240, height: 40)),
        UITextField(frame: CGRect(x: 20, y: 200, width: 240, height: 40))
    ]

    let buttons = [
        UIButton(frame: CGRect(x: 20, y: 150, width: 130, height: 40)),
        UIButton(frame: CGRect(x: 20, y: 200, width: 130, height: 40))
    ]

    let imageGrid = [
        UIImageView(frame: CGRect(x: 20, y: 150, width: 300, height: 130)),
        UIImageView(frame: CGRect(x: 20, y: 340, width: 300, height: 130))
    ]

    let images = [
        UIImage(named: "4"), UIImage(named: "6")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // init first segment content
        for (i, _) in segmentTextFields.enumerated() {
            self.view.addSubview(segmentTextFields[i])
            segmentTextFields[i].borderStyle = .roundedRect
            segmentTextFields[i].clearButtonMode = .whileEditing
            segmentTextFields[i].placeholder = "Placeholder"
        }

        // create third segment
        segmentedControl.insertSegment(withTitle: "Violet", at: 2, animated: true)
    }

    @IBAction func choiceSegment() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            view.backgroundColor = .systemGreen
            for (i, _) in segmentTextFields.enumerated() {
                segmentTextFields[i].isHidden = false
                buttons[i].isHidden = true
                imageGrid[i].isHidden = true
            }
        case 1:
            view.backgroundColor = .systemBlue
            for (i, _) in buttons.enumerated(){
                self.view.addSubview(buttons[i])
                buttons[i].backgroundColor = .systemGreen
                buttons[i].layer.cornerRadius = 5
                buttons[i].titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
                buttons[i].setTitle("Button", for: .normal)
                buttons[i].isHidden = false
                segmentTextFields[i].isHidden = true
                imageGrid[i].isHidden = true
            }
        case 2:
            view.backgroundColor = .purple
            for (i, _) in imageGrid.enumerated(){
                self.view.addSubview(imageGrid[i])
                imageGrid[i].image = images[i]
                imageGrid[i].contentMode = .scaleAspectFill
                imageGrid[i].isHidden = false
                segmentTextFields[i].isHidden = true
                buttons[i].isHidden = true
            }
        default: break
        }
    }

}
