//
//  MemoryGame.swift
//  Todo
//
//  Created by Nazif Enes Kızılcin on 19.04.2022.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards : Array<Card>
  
    func chooseCard(_ card : Card) {
        
    }
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent){
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex);
            cards.append(Card(content: content,id: pairIndex * 2))
            cards.append(Card(content: content,id: pairIndex * 2 + 1))
        }
    }
    struct Card : Identifiable {
        var isMatched : Bool = false
        var isFaceUp : Bool = false
        var content : CardContent
        var id: Int
    }
}
