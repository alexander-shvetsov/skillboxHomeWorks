//
//  GridViewController.swift
//  8-module
//
//  Created by Shvetsov_AV on 26.02.2021.
//

import UIKit

/*
 Честно скажу, это один найденых мною вариантов, кое-где переделанных...
 Но подобные вещи сейчас по моему реализуют через UICollectionView, гораздо изящным способом, или SwiftUI :)
 Я понимаю, фундаментальные вещи надо знать :(
 */

// В идеале – это конечно надо заадаптивить и положить в scrollView
class GridViewController: UIViewController {

    var images = [UIImage]()

    let gridViews = [
        UIImageView(frame: CGRect(x: 10, y: 40, width: 170, height: 250)),
        UIImageView(frame: CGRect(x: 190, y: 40, width: 170, height: 250)),
        UIImageView(frame: CGRect(x: 10, y: 340, width: 170, height: 250)),
        UIImageView(frame: CGRect(x: 190, y: 340, width: 170, height: 250))
    ]

    let gridLabels = [
        UILabel(frame: CGRect(x: 10, y: 300, width: 170, height: 20)),
        UILabel(frame: CGRect(x: 190, y: 300, width: 170, height: 20)),
        UILabel(frame: CGRect(x: 10, y: 600, width: 170, height: 20)),
        UILabel(frame: CGRect(x: 190, y: 600, width: 170, height: 20))
    ]

    let gridTitles = ["Worgen", "IlliDaddy", "Battle for Azeroth", "Some Heroes"]

    override func viewDidLoad() {
        super.viewDidLoad()
        images = [#imageLiteral(resourceName: "9"), #imageLiteral(resourceName: "3"), #imageLiteral(resourceName: "5"), #imageLiteral(resourceName: "4")]

        for (index, _) in gridViews.enumerated() {
            self.view.addSubview(gridViews[index])
            gridViews[index].image = images[index]
            gridViews[index].contentMode = .scaleAspectFill
            gridViews[index].clipsToBounds = true
        }

        for (index, _) in gridLabels.enumerated() {
            self.view.addSubview(gridLabels[index])
            gridLabels[index].text = gridTitles[index]
            gridLabels[index].textColor = .white
        }
    }
}
