//
//  ViewController.swift
//  JogoDaMemoria
//
//  Created by Camille Grings on 10/10/20.
//

import UIKit

var availableImages = ["Card_Anao", "Card_Bruxa", "Card_Cavaleiro","Card_Elfa", "Card_Mago", "Card_Anao", "Card_Bruxa", "Card_Cavaleiro","Card_Elfa", "Card_Mago"]

class ViewController: UIViewController {
    
    @IBOutlet var cards: [UIButton]!

    var game: MemoryGame = MemoryGame(cards: availableImages)

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func pressedImage(_ sender: UIButton) {
        let index = sender.tag
        
        game.selectCard(index: index)
        for card in cards {
            var image = UIImage(named: availableImages[card.tag])
            
            let isCurrentCard = game.currentCardsSelected.contains(card.tag)
            let isMatched  = game.cardsMatched.contains(card.tag)
            
            if !isCurrentCard && !isMatched {
                image = UIImage(named: "Card")
            }
            
            card.setImage(image, for: .normal)
        }
        
        checkStatusGame()
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
        for card in cards {
            card.setImage(UIImage(named: "Card"), for: .normal)
        }
    }
    
}
