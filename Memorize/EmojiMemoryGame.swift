//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Nixon, Pete on 12/28/22.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static let themePicker = ThemePicker()
    static var theme: Theme = ThemePicker.cars
    var score = 0
    static func createMemoryGame() -> MemoryGame<String> {
        var maxPairs = 10
        if maxPairs > theme.emojis.count {
            maxPairs = theme.emojis.count
        }
        return MemoryGame<String>(numberOfPairsOfCards: maxPairs){ pairIndex in
            theme.emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
        score = model.score
        
    }
    
    func change_theme(theme: Theme) {
        EmojiMemoryGame.theme = theme
        model = EmojiMemoryGame.createMemoryGame()
    }
    
    func new_game() {
        EmojiMemoryGame.theme = ThemePicker.themes.randomElement()!
        model = EmojiMemoryGame.createMemoryGame()
    }
}
