//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Yaniv Hasbani on 08/07/2020.
//

import SwiftUI


// ViewModel
class EmojiMemoryGame: ObservableObject {
  // This will cauase that every mutation on model will cause objectWillChange.send() to be called
  @Published private var model: MemoryGame<String> = createMemoryGame()
  static let numberOfPairOfCards = Int(arc4random() % 5)
  
  static func createMemoryGame() -> MemoryGame<String> {
    let emojis = ["😜","👻", "🤬", "🤮", "💩"]
    
    return MemoryGame<String>(numberOfPairOfCards: EmojiMemoryGame.numberOfPairOfCards) { pairIndex in
      
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

struct EmojiMemoryGame_Previews: PreviewProvider {
  static var previews: some View {
    /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
  }
}
