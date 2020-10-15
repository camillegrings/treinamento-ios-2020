//
//  MemoryGameTests.swift
//  JogoDaMemoriaTests
//
//  Created by Camille Grings on 14/10/20.
//

import XCTest
import Quick
import Nimble

@testable import JogoDaMemoria

let card1 = Card(id: 1, type: .Card_Anao)
let card2 = Card(id: 2, type: .Card_Bruxa)
let card3 = Card(id: 3, type: .Card_Cavaleiro)
let card4 = Card(id: 4, type: .Card_Elfa)
let card5 = Card(id: 5, type: .Card_Mago)
let card6 = Card(id: 6, type: .Card_Anao)
let card7 = Card(id: 7, type: .Card_Bruxa)
let card8 = Card(id: 8, type: .Card_Cavaleiro)
let card9 = Card(id: 9, type: .Card_Elfa)
let card10 = Card(id: 10, type: .Card_Mago)

let cardsMock = [card1, card2, card3, card4, card5, card6, card7, card8,card9,card10]


class MemoryGameTests: QuickSpec {

    override
    func spec() {
        var game: MemoryGame!
        
        beforeEach {
            game = MemoryGame(cards: cardsMock)
        }
        
        afterEach {
            // Added refresh so that one test doesnt interfere in the other
            game.refreshGame()
        }
        
        describe("ao jogar normalmente") {
            context("ao precionar uma peça") {
                it("que seja seleciona") {
                    game.selectCard(card: card1)
                    expect(game.currentCardsSelected.count).to(equal(1))
                    expect(game.currentCardsSelected[0].id).to(equal(1))
                    expect(game.currentCardsSelected[0].isSelected).to(beTrue())
                }
            }
            
            context("ao selecionar duas peças diferentes") {
                it("que não sejam combinadas") {
                    game.selectCard(card: card2)
                    game.selectCard(card: card3)

                    expect(game.currentCardsSelected.count).to(equal(2))
                    expect(game.currentCardsSelected[0].type).to(equal(.Card_Bruxa))
                    expect(game.currentCardsSelected[1].type).to(equal(.Card_Cavaleiro))
                    expect(game.currentCardsSelected[0].type).notTo(equal(game.currentCardsSelected[1].type))
                    expect(game.currentCardsSelected[0].isMatched).to(beFalse())
                    expect(game.currentCardsSelected[1].isMatched).to(beFalse())
                }
            }
            
            context("ao selecionar duas peças iguais") {
                it("que sejam combinadas") {
                    game.selectCard(card: card4)
                    game.selectCard(card: card9)

                    expect(game.currentCardsSelected.count).to(equal(2))
                    expect(game.currentCardsSelected[0].type).to(equal(.Card_Elfa))
                    expect(game.currentCardsSelected[1].type).to(equal(.Card_Elfa))
                    expect(game.currentCardsSelected[0].type).to(equal(game.currentCardsSelected[1].type))
                    expect(game.currentCardsSelected[0].isMatched).to(beTrue())
                    expect(game.currentCardsSelected[1].isMatched).to(beTrue())
                }
            }
        }
        
        context("ao selecionar a terceira peças diferente") {
            it("que sejam descartado as peças anteriores") {
                game.selectCard(card: card5)
                game.selectCard(card: card6)
                game.selectCard(card: card7)

                expect(game.currentCardsSelected.count).to(equal(1))
                expect(game.currentCardsSelected[0].type).to(equal(.Card_Bruxa))
                expect(card5.isSelected).to(beFalse())
                expect(card6.isSelected).to(beFalse())
                expect(card7.isSelected).to(beTrue())
            }
        }
        
        context("ao reiniciar") {
            it("que seja limpado as peças selecionas e combinadas") {
                game.refreshGame()

                expect(game.currentCardsSelected.count).to(equal(0))
                expect(game.cardsMatched).to(equal(0))
                expect(game.userAttempts).to(equal(0))
                expect(game.victory).to(beFalse())
            }
        }
        
        context("ao selecionar todas as peças iguais") {
            it("que seja vencido o jogo") {
                game.selectCard(card: card1)
                game.selectCard(card: card6)
                game.selectCard(card: card2)
                game.selectCard(card: card7)
                game.selectCard(card: card3)
                game.selectCard(card: card8)
                game.selectCard(card: card4)
                game.selectCard(card: card9)
                game.selectCard(card: card5)
                game.selectCard(card: card10)

                expect(game.victory).to(beTrue())
                expect(game.cardsMatched).to(equal(10))
                expect(card1.isMatched).to(beTrue())
                expect(card6.isMatched).to(beTrue())
                expect(game.userAttempts).to(equal(10))
            }
        }
    }
}
