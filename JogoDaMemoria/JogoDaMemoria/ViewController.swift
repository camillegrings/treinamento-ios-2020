//
//  ViewController.swift
//  JogoDaMemoria
//
//  Created by Camille Grings on 10/10/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var cardsButton: [UIButton]!

    var game: MemoryGame = MemoryGame.random()

    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonTagAccordingToCards()
        setButtonsInitalState(shouldAnimate: false)
    }

    @IBAction func onButtonPress(_ sender: UIButton) {
        let index = sender.tag
        
        if let selectedCard = game.cards.first(where: { card in card.id == index }) {
            game.selectCard(card: selectedCard)
            
            let image = UIImage(named: selectedCard.type.rawValue)
            sender.setImage(image, for: .normal)
            UIView.transition(with: sender, duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
            
            updateCardButtons()
            checkStatusGame()
        }
    }
    
    @IBAction func resetGame(_ sender: Any) {
        resetState()
    }
}

extension ViewController {
    
    private func setButtonTagAccordingToCards() {
        for (index, button) in cardsButton.enumerated() {
            button.tag = game.cards[index].id
        }
    }
    
    private func checkStatusGame() {
        if game.victory {
            notifyWinner()
        }
    }
    
    private func notifyWinner() {
        let alert = UIAlertController(title: "Boa, você terminou!", message: "Você precisou de \(game.userAttempts) tentativas para finalizar o jogo da memória.", preferredStyle: .alert)
        
        alert.addAction(startAgain)
        present(alert, animated: true, completion: nil)
    }
    
    var startAgain: UIAlertAction {
        UIAlertAction(title: "Bacana, bora de novo", style: .default) { _ in
            self.resetState()
        }
    }
    
    private func resetState() {
        game = MemoryGame.random()
        setButtonsInitalState(shouldAnimate: true)
        setButtonTagAccordingToCards()
    }
    
    private func setButtonsInitalState(shouldAnimate: Bool) {
        for button in cardsButton {
            button.isUserInteractionEnabled = true
            button.setImage(UIImage(named: "Card"), for: .normal)
            if shouldAnimate {
                UIView.transition(with: button, duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
            }
        }
    }
    
    private func updateCardButtons() {
        let buttonsToChangeImage = cardsButton.filter({ $0.imageView?.image != UIImage(named: "Card") })

        for button in buttonsToChangeImage {
            if let card = game.cards.first(where: { card in card.id == button.tag }) {
                if !card.isSelected && !card.isMatched {
                    button.isUserInteractionEnabled = true
                    button.setImage(UIImage(named: card.defaultImage), for: .normal)
                    UIView.transition(with: button, duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
                } else {
                    button.isUserInteractionEnabled = false
                }
            }
        }
    }
    
}
