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
    
    func checkForEqualCards(card: Card) {
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
    
    func clearPreviousSelectedCards() {
        for card in currentCardsSelected {
            card.isSelected = false
        }
        
        currentCardsSelected.removeAll()
    }
    
    func clearMatchedCards(){
        for card in cards {
            card.isMatched = false
        }
        
        cardsMatched = 0
    }
}
