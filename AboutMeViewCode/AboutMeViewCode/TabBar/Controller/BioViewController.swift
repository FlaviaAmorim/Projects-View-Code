//
//  BioViewController.swift
//  AboutMeViewCode
//
//  Created by flaviaamorim on 23/03/21.
//

import UIKit

class BioViewController: UIViewController {

    class BioViewController: UIViewController {

      

      let shareView = ShareImageView(frame: UIScreen.main.bounds)

      let sharedLabel = LabelShare(fullName: "BIO, ashdas, hasuifdh")

      

      override func viewDidLoad() {

        super.viewDidLoad()

        

        view.addSubview(shareView)

        view.addSubview(sharedLabel)

        sharedLabel.setConstraints(view: view)

      }
//    let imageView: UIImageView = {
//        let someImage = UIImageView(frame: UIScreen.main.bounds)
//        someImage.image = UIImage(named: "milky_way")
//        someImage.contentMode = .scaleAspectFill
//        //someImage.translatesAutoresizingMaskIntoConstraints = false
//        return someImage
//    }()
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//       // view.backgroundColor = .white
////        view.addSubview(imageView)
//
////        setupImage()
//
//        let shareView = ShareImageView(frame: UIScreen.main.bounds)
//        view.addSubview(shareView)
//
//        let labelShare = LabelShare(fullName: "Full Name")
//        labelSetup()
//    }
//
//
//    func setupImage(){
//
//        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
//        imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
//        imageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
//        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
//        imageView.contentMode = .scaleAspectFill
//    }
}
