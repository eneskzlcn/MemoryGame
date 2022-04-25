//
//  MemoryGame.swift
//  Todo
//
//  Created by Nazif Enes Kızılcin on 19.04.2022.
//

import Foundation

struct MemoryGame<CardContent> where CardContent : Equatable{
    private(set) var cards : Array<Card>
    
    private var onlyFacedUpBotNotMatchedCardIndex : Int?{
        get { cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly }
        set { cards.indices.forEach { cards[$0].isFaceUp = ( $0 == newValue)} }
    }

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
                cards[chosenIndex].isFaceUp = true
            }else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                onlyFacedUpBotNotMatchedCardIndex = chosenIndex
            }
            
            
        }
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent){
        cards = []
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex);
            cards.append(Card(content: content,id: pairIndex * 2))
            cards.append(Card(content: content,id: pairIndex * 2 + 1))
        }
        cards.shuffle()
    }
    struct Card : Identifiable {
        var isMatched = false
        var isFaceUp = true
        var content : CardContent
        var id: Int
    }
}

extension Array {
    var oneAndOnly : Element? {
        if self.count == 1 {
            return first
        }
        return nil
    }
}
