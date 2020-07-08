//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Yaniv Hasbani on 08/07/2020.
//

import SwiftUI

class EmojiMemoryGame {
  private var model: MemoryGame<String> = createMemoryGame()
  
  static func createMemoryGame() -> MemoryGame<String> {
    let emojis = ["😜","👻", "🤬"]
    
    return MemoryGame<String>(numberOfPairOfCards: emojis.count) { pairIndex in
      return emojis[pairIndex]
    }
  }
  
  // MARK: - Access to the model
  
  var cards: Array<MemoryGame<String>.Card> {
    model.cards
  }
   
  // MARK: - Intent(s)
  
  func choose(_ card: MemoryGame<String>.Card) {
    model.choose(card)
  }
}
