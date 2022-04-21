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
class EmojiMemoryGame {
    static let emojis = ["🚗","🚐","✈️","🚠","🚖","🚤","🛶","🛸","🏎","🚃","🚇","🦯","🚟","🚢","🚉","🛸"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    private var model : MemoryGame<String> =  createMemoryGame()
       
    
    var cards : Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
