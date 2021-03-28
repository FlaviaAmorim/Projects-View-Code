//
//  ViewController.swift
//  PhotoFrameViewCode
//
//  Created by flaviaamorim on 23/03/21.
//

import UIKit

class ViewController: UIViewController {

    let imageView: UIImageView = {
        let someImage = UIImageView()
        someImage.image = UIImage(named: "Boat.png")
        someImage.translatesAutoresizingMaskIntoConstraints = false
        return someImage
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = .white
        view.addSubview(imageView)
        
        setupImage()
    }

    func setupImage(){
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 250).isActive = true
        imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        imageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        imageView.layer.borderColor = UIColor.brown.cgColor
        imageView.layer.borderWidth = 8
        
    }
}

