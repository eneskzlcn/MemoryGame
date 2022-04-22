//
//  ModelView.swift
//  Todo
//
//  Created by Nazif Enes Kızılcin on 19.04.2022.
//

import SwiftUI

func makeCardContent(index : Int) -> String {
    return ""
}
class EmojiMemoryGame : ObservableObject {
    static let emojis = ["🚗","🚐","✈️","🚠","🚖","🚤","🛶","🛸","🏎","🚃","🚇","🦯","🚟","🚢","🚉","🛸"]
    static let numberOfEmojiPairs : Int = 8
  
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: numberOfEmojiPairs) { pairIndex in
            emojis[pairIndex]
        }
    }
    @Published private var model : MemoryGame<String> = createMemoryGame()
    
    var cards : Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    //MARK: Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.chooseCard(card)
    }
}
