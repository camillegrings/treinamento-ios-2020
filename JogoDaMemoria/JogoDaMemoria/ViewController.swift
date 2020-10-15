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
        setButtonIdAccordingToCards()
    }

    @IBAction func pressedImage(_ sender: UIButton) {
        let index = sender.tag
        
        if let selectedCard = game.cards.first(where: { card in card.id == index }) {
            game.selectCard(card: selectedCard)
//            UIView.transition(with: cardsButton[index-1], duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
            updateCardButtons()
            checkStatusGame()
        }
    }
    
    @IBAction func resetGame(_ sender: Any) {
        resetState()
    }
}

extension ViewController {
    
    private func setButtonIdAccordingToCards() {
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
        for cardButton in cardsButton {
            cardButton.setImage(UIImage(named: "Card"), for: .normal)
        }
        setButtonIdAccordingToCards()
    }
    
    private func updateCardButtons() {
        for cardButton in cardsButton {
            if let card = game.cards.first(where: { card in card.id == cardButton.tag }) {
                var image = UIImage(named: card.defaultImage)
               
                if card.isSelected || card.isMatched {
                    image = UIImage(named: card.type.rawValue)
                }
                
                cardButton.setImage(image, for: .normal)
            }
        }
    }
    
}
