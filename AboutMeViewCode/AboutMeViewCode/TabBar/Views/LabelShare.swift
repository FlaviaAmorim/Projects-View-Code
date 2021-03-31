//
//  LabelShare.swift
//  AboutMeViewCode
//
//  Created by flaviaamorim on 24/03/21.
//

import Foundation
import UIKit

class LabelShare: UILabel {
    
    override var text: String? {
        didSet {
            guard let words = text?
                    .components(separatedBy: ", ")
            else { return }
            let joinedWords = words.joined(separator: "\n")
            guard text != joinedWords else { return }
            DispatchQueue.main.async { [weak self] in
                self?.text = joinedWords
            }
        }
    }
    
    init(fullName: String? = "Label Text") {
        super.init(frame: .zero)
        setTextAttributes()
        text = fullName
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setTextAttributes() {
        numberOfLines = 0
        textAlignment = .center
        textColor = UIColor.yellow
        font = UIFont.boldSystemFont(ofSize: 24)
    }
    
    func setConstraints(view: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
