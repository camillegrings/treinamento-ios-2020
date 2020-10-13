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
    let image: String
    let isSelected: Bool
    
    internal init(id: Int, image: String, isSelected: Bool) {
        self.id = id
        self.image = image
        self.isSelected = isSelected
    }
}
