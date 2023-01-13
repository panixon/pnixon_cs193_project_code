//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Nixon, Pete on 12/27/22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
