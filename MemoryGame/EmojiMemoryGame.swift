//
//  ModelView.swift
//  Memory Game
//
//  Created by Nazif Enes Kızılcin on 19.04.2022.
//

import SwiftUI

func makeCardContent(index : Int) -> String {
    return ""
}
class EmojiMemoryGame : ObservableObject {
    typealias Card = MemoryGame<String>.Card
    static let emojis = ["🚗","🚐","✈️","🚠","🚖","🚤","🛶","🛸","🏎","🚃","🚇","🦯","🚟","🚢","🚉","🛸"]
    static let numberOfEmojiPairs : Int = 8
  
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: numberOfEmojiPairs) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards : Array<Card> {
        return model.cards
    }
    
    //MARK: Intent(s)
    
    func choose(_ card: Card) {
        model.chooseCard(card)
    }
}
