//
//  BioViewController.swift
//  AboutMeCode
//
//  Created by flaviaamorim on 24/03/21.
//

import UIKit

class BioViewController: UIViewController {
    
        let imageView: UIImageView = {
            let someImage = UIImageView(frame: UIScreen.main.bounds)
            someImage.image = UIImage(named: "milky_way")
            someImage.contentMode = .scaleAspectFill
            someImage.translatesAutoresizingMaskIntoConstraints = false
            return someImage
        }()
    
    let labelName = UILabel()
    let labelJob = UILabel()
    let labelCity = UILabel()
    let stackLabel = UIStackView()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageView)

        setupImage()
        setupStackLabel()
        setupLabel()
    }
    
        func setupImage(){
    
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
            imageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
            imageView.contentMode = .scaleAspectFill
        }
    
    func setupStackLabel(){
        imageView.addSubview(stackLabel)
        stackLabel.translatesAutoresizingMaskIntoConstraints = false
        stackLabel.distribution = .fillEqually
        stackLabel.axis = .vertical
        stackLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        stackLabel.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 20),
        stackLabel.leadingAnchor.constraint(lessThanOrEqualTo: leadingAnchor, constant: 500),
        stackLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
        stackLabel.topAnchor.constraint(equalTo: topAnchor, constant: 26),
        stackLabel.alignment = .center
    }

    
    func setupLabel(){
        stackLabel.addSubview(labelName)
        stackLabel.addSubview(labelJob)
        stackLabel.addSubview(labelCity)
        labelName.text = "Flavia Amorim de souza"
        labelName.textColor = .orange
        labelJob.text = "Programadora"
        labelJob.textColor = .orange
        labelCity.text = "Curitiba"
        labelCity.textColor = .orange
//        labelJob.anchor(top: (labelJob.topAnchor, 0),
//                        left: (labelJob.leftAnchor, 0)
//                        )
//        labelName.anchor(top: ( labelJob.bottomAnchor, 0),
//                        left: (labelName.leftAnchor, 0)
//                        )
//        labelCity.anchor(top: (labelName.bottomAnchor, 0),
//                        left: (labelCity.leftAnchor, 0)
//                        )
    }

}
