//
//  ContentView.swift
//  Memorize
//
//  Created by Nixon, Pete on 12/27/22.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    @State var emojis: Array<String> = EmojiMemoryGame.theme.emojis
    let themePicker = ThemePicker()
    
    var body: some View {
        VStack {
            HStack {
                Text(EmojiMemoryGame.theme.text).font(.largeTitle)
                Spacer()
                Text("Score: " + String(viewModel.score)).font(.largeTitle)
            }
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 58))]) {
                    ForEach(viewModel.cards) {
                        card in CardView(card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture{
                                viewModel.choose(card)
                            }.foregroundColor(EmojiMemoryGame.theme.backColor)
                    }
                }
            }
            Spacer()
            VStack {
                Button(action: {
                    viewModel.new_game()
                }, label: {
                    Text("New Game").font(.largeTitle)
                })
                HStack {
                    ThemeButton(ThemePicker.cars)
                    ThemeButton(ThemePicker.faces)
                    ThemeButton(ThemePicker.food)
                    ThemeButton(ThemePicker.animals)
                    ThemeButton(ThemePicker.sports)
                    ThemeButton(ThemePicker.misc)
                }
            }
        }
    }
    
    func ThemeButton(_ theme: Theme) -> some View {
        return Button(action: {
            viewModel.change_theme(theme: theme)
        }, label: {
            VStack {
                Image(systemName: theme.label).font(.largeTitle)
                Text(theme.text).font(.subheadline)
            }
        })
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    init (_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                if card.isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                    Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees:110-90)).opacity(0.5).padding(4)
                    Text(card.content).font(font(in: geometry.size))
                } else if (card.isMatched) {
                    shape.opacity(DrawingConstants.zeroOpacity)
                } else {
                    shape.fill(.linearGradient(Gradient(colors: [EmojiMemoryGame.theme.backColor, .white]), startPoint: .top, endPoint: .bottom))
                }
            }
        }
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.emojiScalingFactor)
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 20
        static let lineWidth: CGFloat = 3
        static let emojiScalingFactor: CGFloat = 0.7
        static let zeroOpacity: CGFloat = 0.0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(viewModel: game)
            .preferredColorScheme(.dark)
        EmojiMemoryGameView(viewModel: game)
            .preferredColorScheme(.light)
    }
}

