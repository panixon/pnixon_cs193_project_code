//
//  ContentView.swift
//  Memorize
//
//  Created by Nixon, Pete on 12/27/22.
//

import SwiftUI

struct ContentView: View {
    var carEmojis = [
        "🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🛵", "🛺", "🚲", "🚝"
    ]
    var faceEmojis = [
        "😅", "😀", "😄", "😆", "🥹", "😊", "😍", "😜"
    ]
    var foodEmojis = [
        "🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🫐", "🍈", "🍒", "🍑", "🥭", "🍍", "🥥", "🥝", "🍅", "🍆"
    ]

    @State var emojiCount = 6
    @State var emojis: Array<String> = [
        "🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🛵", "🛺", "🚲", "🚝"
    ].shuffled()
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) {
                        emoji in CardView(content: emoji).aspectRatio(contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                cars
                faces
                food
            }
            HStack {
                remove
                Spacer()
                Text("Shuffle").font(.largeTitle).foregroundColor(.red)
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
    var cars: some View {
        Button(action: {
            emojiCount = 6
            emojis = carEmojis.shuffled()
        }, label: {
            VStack {
                Image(systemName: "car").font(.largeTitle)
                Text("Cars").font(.subheadline)
            }
        })
    }
    var faces: some View {
            Button(action: {
                emojiCount = 6
                emojis = faceEmojis.shuffled(
                )}, label: {
            VStack {
                Image(systemName: "face.smiling").font(.largeTitle)
                Text("Faces").font(.subheadline)
            }
        })
    }
    var food: some View {
        Button(action: {
            emojiCount = 6
            emojis = foodEmojis.shuffled()
        }, label: {
            VStack {
                Image(systemName: "fork.knife").font(.largeTitle)
                Text("Food").font(.subheadline)
            }
        })
    }
    var remove: some View {
        Button(action: {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        }, label: {Image(systemName: "minus.square")})
    }
    var add: some View {
        Button(action: {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        }, label: {Image(systemName: "plus.square")
            })
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true

    var body: some View {
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}



















	













struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}

