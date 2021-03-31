//
//  ViewController.swift
//  RPS
//
//  Created by flaviaamorim on 09/02/21.
//

import UIKit



class ViewController: UIViewController {
    
    let labelSignComputer = UILabel()
    let labelStatus = UILabel()
    let buttonRock = UIButton()
    let buttonPapper = UIButton()
    let buttonScissors = UIButton()
    let buttonPlayAgains = UIButton()
    
    @objc func buttonRockChoice(_ sender: Any) {
        play(userSign: .rock)
    }
    
    @objc func buttonPapperChoice(_ sender: Any) {
        play(userSign: .papper)
    }
    
    @objc func buttonScissorsChoice(_ sender: Any) {
        play(userSign: .scissors)
    }
    
    @objc func buttonPlayAgain(_ sender: Any) {
        updateUI(state: .start)
    }
    
    private lazy var stackVertical: UIStackView = {
        let stackVertical = UIStackView(arrangedSubviews: [labelSignComputer, labelStatus, stackViewkHorizontal, buttonPlayAgains])
        stackVertical.distribution = .fill
        stackVertical.alignment = .center
        stackVertical.axis = .vertical
        stackVertical.spacing = 50
        stackVertical.contentMode = .scaleToFill
        
        return stackVertical
    }()
    
    private lazy var stackViewkHorizontal: UIStackView = {
        let stackViewHorizontal = UIStackView(arrangedSubviews: [buttonRock, buttonPapper, buttonScissors])
        stackViewHorizontal.distribution = .fill
        stackViewHorizontal.alignment = .fill
        stackViewHorizontal.axis = .horizontal
        stackViewHorizontal.contentMode = .scaleToFill
        stackViewHorizontal.spacing = 70
        
        return stackViewHorizontal
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonRock.addTarget(self, action: #selector(buttonRockChoice), for: .touchUpInside)
        buttonPapper.addTarget(self, action: #selector(buttonPapperChoice), for: .touchUpInside)
        buttonScissors.addTarget(self, action: #selector(buttonScissorsChoice), for: .touchUpInside)
        buttonPlayAgains.addTarget(self, action: #selector(buttonPlayAgain), for: .touchUpInside)
        
        setupStackVertical()
        setupButtons()
        setupLabel()
        updateUI(state: .start)
    }

    func updateUI(state:GameStates) {
        labelStatus.text = state.status
        
        switch state {
        case .start:
            view.backgroundColor = .gray
            labelSignComputer.text = "🤖"
            buttonPlayAgains.isHidden = true
            
            buttonRock.isHidden = false
            buttonPapper.isHidden = false
            buttonScissors.isHidden = false
            
            buttonRock.isEnabled = true
            buttonPapper.isEnabled = true
            buttonScissors.isEnabled = true
            
        case .win:
            view.backgroundColor = .green
            view.backgroundColor = UIColor(red: 0.6, green: 0.7, blue: 0.5, alpha: 1)
        case .lose:
            view.backgroundColor = .red
            view.backgroundColor = UIColor(red: 0.7, green: 0.5, blue: 0.4, alpha: 1)
        case .draw:
            view.backgroundColor = .orange
        }
    }
    
    func play(userSign: Sign) {
        let computerSign = randomSign()
        let gameState = userSign.gameState(against: computerSign)
        updateUI(state: gameState)
        
        labelSignComputer.text = computerSign.emoji
        
        buttonRock.isEnabled = false
        buttonPapper.isEnabled = false
        buttonScissors.isEnabled = false
        
        buttonRock.isHidden = true
        buttonPapper.isHidden = true
        buttonScissors.isHidden = true
        
        switch userSign {
        case .rock:
            buttonRock.isHidden = false
        case .papper:
            buttonPapper.isHidden = false
        case .scissors:
            buttonScissors.isHidden = false
        }
        
        buttonPlayAgains.isHidden = false
    }
    
    func setupStackVertical(){
        
        view.addSubview(stackVertical)
 
        stackVertical.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([stackVertical.topAnchor.constraint(equalTo: view.topAnchor,constant: 110),
                                     stackVertical.leftAnchor.constraint(equalTo: view.leftAnchor),
                                     stackVertical.rightAnchor.constraint(equalTo: view.rightAnchor),
                                     stackVertical.heightAnchor.constraint(equalToConstant: 490)]
        )
    }
    
    func setupButtons() {
        buttonRock.setTitle("👊🏼", for: .normal)
        buttonRock.titleLabel?.font = UIFont.boldSystemFont(ofSize: 70)
        buttonPapper.setTitle("🖐🏼", for: .normal)
        buttonPapper.titleLabel?.font = UIFont.boldSystemFont(ofSize: 70)
        buttonScissors.setTitle("✌🏼", for: .normal)
        buttonScissors.titleLabel?.font = UIFont.boldSystemFont(ofSize: 70)
        buttonPlayAgains.setTitle("Play Again", for: .normal)
        buttonPlayAgains.setTitleColor(.systemBlue, for: .normal)
    }
    
    func setupLabel() {
        labelSignComputer.font = UIFont.boldSystemFont(ofSize: 70)
    }
}

