//
//  ViewController.swift
//  Random Photo
//
//  Created by Rashid Gaitov on 22.06.2022.
//

import UIKit


class ViewController: UIViewController {

    let image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .systemGray
        return image
    }()
    let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGray
        button.setTitle("Change Photo", for: .normal)
        return button
    }()

    let colors: [UIColor] = [
        .systemRed,
        .systemBlue,
        .systemYellow,
        .systemGray,
        .systemBlue,
        .systemPink
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemYellow
        view.addSubview(image)
        view.addSubview(button)
        
        image.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        image.center = view.center

        getRandomPhoto()
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        button.frame = CGRect(x: 30,
                              y: view.frame.size.height - 100,
                              width: view.frame.size.width - 60,
                              height: 50)
    }
    
    func getRandomPhoto() {
        let urlString = "https://picsum.photos/300"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        image.image = UIImage(data: data)
    }
    
    @objc func buttonPressed() {
        getRandomPhoto()
        view.backgroundColor = colors.randomElement()
    }

}

