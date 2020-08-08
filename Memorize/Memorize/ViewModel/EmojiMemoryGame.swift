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
  
  static func createMemoryGame(_ score: Int = 0) -> MemoryGame<String> {
    let theme = themes.randomElement() ?? HalloweenTheme()
    
    return MemoryGame<String>(theme, score) { pairIndex in
      return theme.emojies[pairIndex]
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
  
  func newGame() {
    model = EmojiMemoryGame.createMemoryGame(model.score)
  }
}

extension EmojiMemoryGame {
  static var themes: [Theme] = [
    HalloweenTheme(),
    FaceTheme(),
    FoodTheme(),
    SportTheme(),
    FlagTheme()
  ]
  
  var themeName: String {
    model.theme.name
  }
  
  var themeColor: Color {
    model.theme.color
  }
}

extension EmojiMemoryGame {
  var score: Int {
    model.score
  }
  
  func match() {
    model.match()
  }
  
  func mismatch() {
    model.mismatch()
  }
}

struct EmojiMemoryGame_Previews: PreviewProvider {
  static var previews: some View {
    /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
  }
}
