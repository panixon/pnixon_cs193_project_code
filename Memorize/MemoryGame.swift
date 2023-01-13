//
//  MemoryGame.swift
//  Memorize
//
//  Created by Nixon, Pete on 12/28/22.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    private(set) var cards: Array<Card>
    private var indexOfTheFaceUpCard: Int? {
        get { return cards.indices.filter({cards[$0].isFaceUp}).oneAndOnly }
        set { cards.indices.forEach {cards[$0].isFaceUp = ($0 == newValue) } }
    }
    private(set) var score: Int
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}),
            !cards[chosenIndex].isFaceUp,
            !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfTheFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                } else {
                    if cards[chosenIndex].seen {
                        score -= 1
                    } else {
                        cards[chosenIndex].seen = true
                    }
                    if cards[potentialMatchIndex].seen {
                        score -= 1
                    } else {
                        cards[potentialMatchIndex].seen = true
                    }
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                indexOfTheFaceUpCard = chosenIndex
            }
        }
    }
        
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        score = 0
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(id: pairIndex*2, content: content))
            cards.append(Card(id: pairIndex*2+1, content: content))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        let id: Int
        var seen = false
        
        var isFaceUp: Bool {
            willSet {
                if newValue {
                    startUsingBonusTime()
                } else {
                    stopUsingBonusTime()
                }
            }
        }
        init(id: Int, content: CardContent) {
            self.id = id
            self.content = content
            self.isFaceUp = false
        }
        var isMatched = false
        let content: CardContent
        
        func startUsingBonusTime() {
            // stub
        }
        
        func stopUsingBonusTime() {
            // stub
        }
    }
}

extension Array {
    var oneAndOnly: Element? {
        if count == 1 {
            return first
        } else {
           return nil
        }
    }
}
