//
//  ViewController.swift
//  JogoDaMemoria
//
//  Created by Camille Grings on 10/10/20.
//

import UIKit

var card1 = Card(id: 1, type: .Card_Anao)
var card2 = Card(id: 2, type: .Card_Bruxa)
var card3 = Card(id: 3, type: .Card_Cavaleiro)
var card4 = Card(id: 4, type: .Card_Elfa)
var card5 = Card(id: 5, type: .Card_Mago)
var card6 = Card(id: 6, type: .Card_Anao)
var card7 = Card(id: 7, type: .Card_Bruxa)
var card8 = Card(id: 8, type: .Card_Cavaleiro)
var card9 = Card(id: 9, type: .Card_Elfa)
var card10 = Card(id: 10, type: .Card_Mago)

var cardsMock = [card1, card2, card3, card4, card5, card6, card7, card8,card9,card10]

class ViewController: UIViewController {
    
    @IBOutlet var cardsButton: [UIButton]!

    var game: MemoryGame = MemoryGame(cards: cardsMock)

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        game.refreshGame()
        for cardButton in cardsButton {
            cardButton.setImage(UIImage(named: "Card"), for: .normal)
        }
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
