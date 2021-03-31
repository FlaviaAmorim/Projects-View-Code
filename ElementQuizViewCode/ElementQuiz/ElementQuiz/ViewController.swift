//
//  ViewController.swift
//  ElementQuiz
//
//  Created by flaviaamorim on 10/02/21.
//

import UIKit

enum Mode {
    case flashCard
    case quiz
}

enum State {
    case question
    case answer
    case score
}


class ViewController: UIViewController, UITextFieldDelegate {
    
    @objc func showAnswer(_ sender: UIButton) {
        state = .answer
        
        updateUI()
    }
    
    @objc func segmentControl(_ sender: Any) {
       switch (segmentedControl.selectedSegmentIndex) {
          case 0:
            mode = .flashCard
          break
          case 1:
            mode = .quiz
          break
          default:
          break
       }
    }
    
    @objc func nextElement(_ sender: UIButton) {
        currentElementIndex += 1
        
        if currentElementIndex >= elementList.count {
            currentElementIndex = 0
            if mode == .quiz {
                state = .score
                updateUI()
                return
            }
        }
        
        state = .question
        
        updateUI()
    }
    
    var fixedElementList = ["Carbon", "Gold", "Chlorine", "Sodium"]
    var elementList: [String] = []
    var currentElementIndex = 0
    var mode: Mode = .flashCard {
        didSet {
            switch mode {
            case .flashCard:
                setupFlashCards()
            case .quiz:
                setupQuiz()
            }
            
            updateUI()
        }
    }
    var state: State = .question
//Estado especifico de teste
    var answerIsCorrect = false
    var correctAnswerCount = 0
    

    let labelElement = UILabel()
    let segmentedControl = UISegmentedControl()
    let imageElement = UIImageView()
    let textFieldAnswers = UITextField()
    let showAnswerElementButton = UIButton()
    let nextElementButton = UIButton()
    
    private lazy var stackVertical: UIStackView = {
        let stackVertical = UIStackView(arrangedSubviews: [segmentedControl, imageElement, labelElement, textFieldAnswers, stackViewkHorizontal])
        stackVertical.distribution = .fill
        stackVertical.alignment = .center
        stackVertical.axis = .vertical
        stackVertical.spacing = 10
        
        return stackVertical
    }()
    
   private lazy var stackViewkHorizontal: UIStackView = {
    let stackViewHorizontal = UIStackView(arrangedSubviews: [showAnswerElementButton, nextElementButton])
    stackViewHorizontal.distribution = .fill
    stackViewHorizontal.alignment = .center
    stackViewHorizontal.axis = .horizontal
    stackViewHorizontal.spacing = 20
    
    return stackViewHorizontal
    }()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        textFieldAnswers.delegate = self
        
        segmentedControl.addTarget(self, action: #selector(segmentControl), for: .valueChanged)
        nextElementButton.addTarget(self, action: #selector(nextElement), for: .touchUpInside)
        showAnswerElementButton.addTarget(self, action: #selector(showAnswer), for: .touchUpInside)
        
        setupUI()
        mode = .flashCard
    }
    
//Atualiza a UI no modo ficha de estudo
    func updateFlashCardUI(elementName: String) {
        //Controle segmentado
        segmentedControl.selectedSegmentIndex = 0
        
//Campo de texto e teclado
        textFieldAnswers.isHidden = true
        textFieldAnswers.resignFirstResponder()
        
//Rotulo da resposta
        if state == .answer {
            labelElement.text = elementName
        } else {
            labelElement.text = "?"
        }
        
//Botoes
        showAnswerElementButton.isHidden = false
        nextElementButton.isEnabled = true
        nextElementButton.setTitle("Next Element", for: .normal)
    }
    
//Atualiza a UI no modo teste
    func updateQuizUI(elementName: String) {
        
        segmentedControl.selectedSegmentIndex = 1

        
//Campo de texto e teclado
        textFieldAnswers.isHidden = false
        switch state {
        case .question:
            textFieldAnswers.isEnabled = true
            textFieldAnswers.text = ""
            textFieldAnswers.becomeFirstResponder()
        case .answer:
            textFieldAnswers.isEnabled = false
            textFieldAnswers.resignFirstResponder()
        case .score:
            textFieldAnswers.isHidden = true
            textFieldAnswers.resignFirstResponder()
        }

//Rotulo da resposta
        switch state {
        case .question:
            labelElement.text = ""
        case .answer:
            if answerIsCorrect {
                labelElement.text = "Correto!"
            } else {
                labelElement.text = "❌\nResposta correta:" + elementName
            }
        case .score:
            labelElement.text = ""
            print("Seu score é \(correctAnswerCount) de \(elementList.count).")
        }
        
        if state == .score {
            displayScoreAlert()
        }
        
//Botoes
        showAnswerElementButton.isHidden = true
        if currentElementIndex == elementList.count - 1 {
            nextElementButton.setTitle("Mostrar pontuacao", for: .normal)
        } else {
            nextElementButton.setTitle("Next Element", for: .normal)
        }
        
        switch state {
        case .question:
            nextElementButton.isEnabled = false
        case .answer:
            nextElementButton.isEnabled = true
        case .score:
            nextElementButton.isEnabled = false
        }
    }
    
//Atualiza a UI com base no seu modo e estado
    func updateUI() {
        
//Codigo compartilhado
        let elementName = elementList[currentElementIndex]
        let image = UIImage(named: elementName)
        imageElement.image = image
        
        
        switch mode {
        case .flashCard:
            updateFlashCardUI(elementName: elementName)
        case .quiz:
            updateQuizUI(elementName: elementName)
        }
    }
    
//Executa após o usuário pressionar a tecla Return no teclado
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//Pega o texto da textField
        let textFieldContents = textField.text!
//Determina se o usuário respondeu corretamente e atualiza o estado de teste
        if textFieldContents.lowercased() == elementList[currentElementIndex].lowercased() {
            answerIsCorrect = true
            correctAnswerCount += 1
        } else {
            answerIsCorrect = false
        }
//O aplicativo agora deve mostrar a resposta ao usuário
        state = .answer
        updateUI()
        return true
    }
    
//Mostra um alerta com a pontuacao do teste do usuario
    func displayScoreAlert() {
        let alert = UIAlertController(title: "Score", message: "Sua pontuação é \(correctAnswerCount) de \(elementList.count).", preferredStyle: .alert)
        
        let dismissAction = UIAlertAction(title: "OK", style: .default, handler: scoreAlertDismissed(_:))
        alert.addAction(dismissAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func scoreAlertDismissed(_ action: UIAlertAction) {
        mode = .flashCard
    }
    
//Abre uma nova sessao de ficha de estudo
    func setupFlashCards() {
        state = .question
        currentElementIndex = 0
        elementList = fixedElementList
    }
    
//Abre um novo teste
    func setupQuiz() {
        state = .question
        currentElementIndex = 0
        answerIsCorrect = false
        correctAnswerCount = 0
        elementList = fixedElementList.shuffled()
    }
    
    func setupUI() {
        
        setupStackVertical()
        setupSegmentedControl()
        setupImageElement()
        setupLabelElement()
        setupTextFieldAnswers()
        setupshowAnswerElementButton()
        setupNextElementButton()
    }
    
    func setupStackVertical(){
        
        view.addSubview(stackVertical)
 
        stackVertical.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([stackVertical.topAnchor.constraint(equalTo: view.topAnchor,constant: 80),
                                     stackVertical.leftAnchor.constraint(equalTo: view.leftAnchor),
                                     stackVertical.rightAnchor.constraint(equalTo: view.rightAnchor),
                                     stackVertical.heightAnchor.constraint(equalToConstant: 400)]
        )
        
//        stackVertical.anchor(top: (topAnchor, 50),
//                             left: (view.leftAnchor, 0),
//                             right: (view.rightAnchor, 0),
//                             height: 340
//        )
        
    }
    
    func setupSegmentedControl() {
        segmentedControl.insertSegment(withTitle: "Flash Cards", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "Quiz", at: 1, animated: true)
        segmentedControl.selectedSegmentTintColor = .yellow
    }
    
    func setupImageElement() {
        imageElement.contentMode = .scaleAspectFill
//        imageElement.image = UIImage(named: "Carbon")
    }
    
    func setupLabelElement() {
        labelElement.text = "Rótulo de Respostas"
        labelElement.font = .boldSystemFont(ofSize: 24)
        labelElement.numberOfLines = 0
    }
    
    func setupTextFieldAnswers() {
        textFieldAnswers.text = "?"
        textFieldAnswers.font = .systemFont(ofSize: 20)
        textFieldAnswers.borderStyle = .bezel
        textFieldAnswers.placeholder = "Enter text here"
        textFieldAnswers.borderStyle = UITextField.BorderStyle.roundedRect
        textFieldAnswers.autocorrectionType = UITextAutocorrectionType.no
        textFieldAnswers.clearButtonMode = UITextField.ViewMode.whileEditing
        textFieldAnswers.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
    }
    
    func setupshowAnswerElementButton() {
        showAnswerElementButton.setTitle("Show Answer", for: .normal)
        showAnswerElementButton.setTitleColor(.systemBlue, for: .normal)
    }
    
    func setupNextElementButton() {
        nextElementButton.setTitle("Next Element", for: .normal)
        nextElementButton.setTitleColor(.systemBlue, for: .normal)
    }
}
