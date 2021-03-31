//
//  FamilyViewController.swift
//  AboutMeViewCode
//
//  Created by flaviaamorim on 23/03/21.
//

import UIKit

class FamilyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let shareView = ShareImageView(frame: UIScreen.main.bounds)
        view.addSubview(shareView)
        
        let bio = "Irmã: Brenda Stefanie, Irmã: Daniela Cristina"
        let shareLabel = LabelShare(fullName: bio)
        view.addSubview(shareLabel)
        shareLabel.setConstraints(view: view)
    }
}
