//
//  MemoryGame.swift
//  JogoDaMemoria
//
//  Created by Camille Grings on 10/10/20.
//

import Foundation

class MemoryGame {
    
    let maxNumberCards = 10
    let maxNumberSelectedCards = 2
    
    var cards: [Card] = []
    
    private(set) var userAttempts: Int = 0
    private(set) var currentCardsSelected: [Card] = []
    private(set) var victory = false
    private(set) var cardsMatched: Int = 0 {
        didSet {
            if cardsMatched >= maxNumberCards {
                victory = true
            }
        }
    }
    
    internal init(cards: [Card] = []) {
        self.cards = cards
    }
    
    func selectCard(card: Card) {
        guard !card.isSelected && !card.isMatched else { return }
        
        if currentCardsSelected.count == maxNumberSelectedCards {
            clearPreviousSelectedCards()
        }
        
        if !currentCardsSelected.isEmpty {
            checkForEqualCards(card: card)
        }
        
        currentCardsSelected.append(card)
        card.isSelected = true
        
        userAttempts += 1
    }
    
    private func checkForEqualCards(card: Card) {
        let firstCard = currentCardsSelected[0]
        
        if firstCard.type == card.type {
            firstCard.isMatched = true
            card.isMatched = true
            cardsMatched += 2
        }
    }
    
    func refreshGame() {
        userAttempts = 0
        clearPreviousSelectedCards()
        clearMatchedCards()
        victory = false
    }
    
    private func clearPreviousSelectedCards() {
        for card in currentCardsSelected {
            card.isSelected = false
        }
        
        currentCardsSelected.removeAll()
    }
    
    private func clearMatchedCards(){
        for card in cards {
            card.isMatched = false
        }
        
        cardsMatched = 0
    }
}

extension MemoryGame {
    class func random() -> MemoryGame {
        var cards: [Card] = []
        
        cards.append(generateNewCard(type: .Card_Anao, id: 1))
        cards.append(generateNewCard(type: .Card_Bruxa, id: 2))
        cards.append(generateNewCard(type: .Card_Cavaleiro, id: 3))
        cards.append(generateNewCard(type: .Card_Elfa, id: 4))
        cards.append(generateNewCard(type: .Card_Mago, id: 5))
        
        cards.append(generateNewCard(type: .Card_Anao, id: 6))
        cards.append(generateNewCard(type: .Card_Bruxa, id: 7))
        cards.append(generateNewCard(type: .Card_Cavaleiro, id: 8))
        cards.append(generateNewCard(type: .Card_Elfa, id: 9))
        cards.append(generateNewCard(type: .Card_Mago, id: 10))
        
        return MemoryGame(cards: cards.shuffled())
    }
}
