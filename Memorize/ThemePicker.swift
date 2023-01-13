//
//  ThemePicker.swift
//  Memorize
//
//  Created by Nixon, Pete on 12/29/22.
//

import SwiftUI

struct ThemePicker {
    static let cars = Theme(label: "car", backColor: .red, text: "Cars", emojis: ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🛵", "🛺", "🚲", "🚝"])
    static let faces = Theme(label: "face.smiling", backColor: .blue, text: "Faces", emojis: ["😅", "😀", "😄", "😆", "🥹", "😊", "😍", "😜"])
    static let food = Theme(label: "fork.knife", backColor: .green, text: "Food", emojis: ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🫐", "🍈", "🍒", "🍑", "🥭", "🍍", "🥥", "🥝", "🍅", "🍆"])
    static let animals = Theme(label: "pawprint", backColor: .brown, text: "Animals", emojis: ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵", "🐔", "🐧"])
    static let sports = Theme(label: "sportscourt.circle.fill", backColor: .gray, text: "Sports", emojis: ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾", "🏐", "🏉", "🏸", "🥏", "🎱", "🪀", "🏓"])
    static let misc = Theme(label: "command", backColor: .gray, text: "Misc", emojis: ["⌚️", "📱", "☎️", "💻", "⌨️", "🖥", "🖨", "🖱", "🕹", "💽", "📸", "📹", "🎛", "🧭"])
    static let themes = [cars, faces, food, animals, sports, misc]
}

struct Theme {
    let label: String
    let backColor: Color
    let text: String
    let emojis: [String]
}
