//
//  MemoryGame.swift
//  Memorize
//
//  Created by Yaniv Hasbani on 08/07/2020.
//

import Foundation

struct MemoryGame<CardContent> {
  var cards: Array<Card>
  
  init(numberOfPairOfCards: Int, cardContentFactory: (Int) -> CardContent) {
    cards = Array<Card>()
    
    for pairIndex in 0..<numberOfPairOfCards {
      let cardContent = cardContentFactory(pairIndex)
      cards.append(Card(id: pairIndex * 2, isFaceUp: true, isMatched: false, content: cardContent))
      cards.append(Card(id: pairIndex * 2 + 1, isFaceUp: true, isMatched: false, content: cardContent))
    }
  }
  
  func choose(_ card: Card) {
    print("card chosen: \(card)")
  }
  
  struct Card: Identifiable {
    var id: Int
    var isFaceUp: Bool
    var isMatched: Bool
    var content: CardContent
  }
}


