//
//  MemoryGame.swift
//  JogoDaMemoria
//
//  Created by Camille Grings on 10/10/20.
//

import Foundation

class MemoryGame {

    var cards: [String] = []
    let maxNumberCards = 10
    
    private(set) var userAttempts: Int = 0
    private(set) var currentCardsSelected: [Int] = []
    private(set) var cardsMatched: [Int] = [] {
        didSet {
            if cardsMatched.count >= maxNumberCards {
                victory = true
            }
        }
    }
    
    private(set) var victory = false
    
    internal init(cards: [String] = []) {
        self.cards = cards
    }
    
    func selectCard(index: Int) {
        let isNewIndex = !currentCardsSelected.contains(index)
        let isNotMatched = !cardsMatched.contains(index)
        
        guard isNewIndex && isNotMatched else { return }
        
        if currentCardsSelected.count == 2 {
            currentCardsSelected.removeAll()
        }
        
        if !currentCardsSelected.isEmpty {
            checkForEqualCards(index: index)
        }
        
        currentCardsSelected.append(index)
        userAttempts += 1
    }
    
    func checkForEqualCards(index: Int) {
        let firstCard = currentCardsSelected[0]
        let isCardsEquals = cards[firstCard].elementsEqual(cards[index])
        if isCardsEquals {
            cardsMatched.append(firstCard)
            cardsMatched.append(index)
        }
    }
    
    func refreshGame() {
        userAttempts = 0
        currentCardsSelected.removeAll()
        cardsMatched.removeAll()
        victory = false
    }
}
