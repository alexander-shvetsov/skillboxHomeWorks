//
//  ViewController.swift
//  8-module
//
//  Created by Shvetsov_AV on 17.02.2021.
//

import UIKit

class GalleryViewController: UIViewController {

    @IBOutlet weak var galleryImageView: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var galleryProgressView: UIProgressView!
    
    let gallery = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    var index = 0
    var progress: Float = 0.1

    override func viewDidLoad() {
        super.viewDidLoad()
        
        backButton.isEnabled = false
        backButton.alpha = 0.3

        galleryImageView.image = UIImage(named: gallery[index])

        galleryProgressView.setProgress(progress, animated: true)
    }

    @IBAction func nextImageButton() {
        if index == gallery.count - 1 {
            nextButton.isEnabled = false
            nextButton.alpha = 0.3
        } else {
            backButton.isEnabled = true
            backButton.alpha = 1
            index += 1
            galleryImageView.image = UIImage(named: gallery[index])

            // не лучшая практика, но хотелось попробовать :)
            progress += 0.1
            galleryProgressView.setProgress(progress, animated: true)
        }
    }
    
    @IBAction func backImageButton() {
        if index == 0 {
            backButton.isEnabled = false
            backButton.alpha = 0.3
        } else {
            index -= 1
            galleryImageView.image = UIImage(named: gallery[index])

            // не лучшая практика, но хотелось попробовать :)
            nextButton.isEnabled = true
            nextButton.alpha = 1
            progress -= 0.1
            galleryProgressView.setProgress(progress, animated: true)
        }
    }
}

/*
 Не нравится мне как отрабатывают статусы элементов.
 "Короткое" простое решение в голову не идёт,
 а всё через какой-нибудь switch statement запускать не охото...
 */
