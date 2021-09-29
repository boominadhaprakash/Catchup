//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by BKS-GGS on 25/09/21.
//

import SwiftUI

/// ViewModel
class EmojiMemoryGame: ObservableObject {
    static let emojis = ["🚲", "🚂", "🚁","🚜", "🚕", "🛴", "🚑", "🚅",
                         "🍖", "🌽", "🍊", "🍓","🍇", "🥥", "🥒","🥝",
                         "🏂", "🏀", "🏋️‍♀️", "🏏", "🎱", "🤼‍♂️", "⛹️‍♀️","🚴‍♂️"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    /// MVVM -> Kicks from View Model to View
    /// @Published vs ObjectWillChange.send()
    /// @Published is modifier to the existing object whenever there is a change in your video model automatically respective view will get reloaded or recreated automatically
    /// ObjectWillChange.send() we explictly telling to our view please reload. because there is new change has occured recently!
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
