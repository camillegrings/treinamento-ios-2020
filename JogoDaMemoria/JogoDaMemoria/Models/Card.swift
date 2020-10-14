//
//  Card.swift
//  JogoDaMemoria
//
//  Created by Camille Grings on 13/10/20.
//

import Foundation


class Card {
    let id: Int
    let defaultImage = "Card"
    let type: CardTypes
    var isSelected: Bool
    var isMatched: Bool
    
    internal init(id: Int, type: CardTypes) {
        self.id = id
        self.type = type
        self.isSelected = false
        self.isMatched = false
    }
}
