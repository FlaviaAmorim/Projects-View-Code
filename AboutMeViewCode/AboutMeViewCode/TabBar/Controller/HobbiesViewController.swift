//
//  HobbiesViewController.swift
//  AboutMeViewCode
//
//  Created by flaviaamorim on 23/03/21.
//

import UIKit

class HobbiesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let shareView = ShareImageView(frame: UIScreen.main.bounds)
        view.addSubview(shareView)
        
        let bio = "Ler, Jogar, Passear"
        let shareLabel = LabelShare(fullName: bio)
        view.addSubview(shareLabel)
        shareLabel.setConstraints(view: view)
    }
}
