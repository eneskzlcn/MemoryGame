//
//  MemoryGame.swift
//  Todo
//
//  Created by Nazif Enes Kızılcin on 19.04.2022.
//

import Foundation

struct MemoryGame<CardContent> where CardContent : Equatable{
    private(set) var cards : Array<Card>
    
    private var onlyFacedUpBotNotMatchedCardIndex : Int?

    mutating func chooseCard(_ card : Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
            !cards[chosenIndex].isMatched,
            !cards[chosenIndex].isFaceUp
        {
            if let potentialMatchIndex = onlyFacedUpBotNotMatchedCardIndex {
                if cards[potentialMatchIndex].content == cards[chosenIndex].content {
                    cards[potentialMatchIndex].isMatched = true
                    cards[chosenIndex].isMatched = true
                }
                onlyFacedUpBotNotMatchedCardIndex = nil
            }else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                onlyFacedUpBotNotMatchedCardIndex = chosenIndex
            }
            cards[chosenIndex].isFaceUp = true
            
        }
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent){
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex);
            cards.append(Card(content: content,id: pairIndex * 2))
            cards.append(Card(content: content,id: pairIndex * 2 + 1))
        }
        cards.shuffle()
    }
    struct Card : Identifiable {
        var isMatched : Bool = false
        var isFaceUp : Bool = false
        var content : CardContent
        var id: Int
    }
}


