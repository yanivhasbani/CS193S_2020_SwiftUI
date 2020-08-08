//
//  MemoryGame.swift
//  Memorize
//
//  Created by Yaniv Hasbani on 08/07/2020.
//

import Foundation

// Model
struct MemoryGame<CardContent> where CardContent: Equatable {
  private(set) var cards: Array<Card>
  private(set) var theme: Theme
  private(set) var score: Int
  
  var onlyCardFacingUpIndex: Int? {
    get { cards.indices.filter { cards[$0].isFaceUp }.only }
    set {
      for index in cards.indices {
        cards[index].isFaceUp = index == newValue
      }
    }
  }
  
  init(_ theme: Theme, _ score: Int, cardContentFactory: (Int) -> CardContent) {
    self.theme = theme
    self.score = score
    cards = Array<Card>()
    for pairIndex in 0..<(theme.numberOfCards ?? theme.randomNumberOfCards) {
      let cardContent = cardContentFactory(pairIndex)
      cards.append(Card(id: pairIndex * 2, isFaceUp: false,
                        isMatched: false, wasSelected: false, content: cardContent))
      cards.append(Card(id: pairIndex * 2 + 1, isFaceUp: false,
                        isMatched: false, wasSelected: false, content: cardContent))
    }
    
    cards.shuffle()
  }
  
  mutating func choose(_ card: Card) {
    if let chosenIndex = cards.firstIndex(matching: card),
         !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
      if let potentialMatchedIndex = onlyCardFacingUpIndex {
        if cards[chosenIndex].content == cards[potentialMatchedIndex].content {
          cards[chosenIndex].isMatched = true
          cards[potentialMatchedIndex].isMatched = true
          match()
        } else {
          if cards[chosenIndex].wasSelected {
            mismatch()
          }
        }
        onlyCardFacingUpIndex = nil
      } else {
        onlyCardFacingUpIndex = chosenIndex
        cards[chosenIndex].wasSelected = true
      }
    }
  }
  
  func index(of card: Card) -> Int {
    for index in 0..<self.cards.count {
      if self.cards[index].id == card.id {
        return index
      }
    }
    
    return 0 //TODO: bogus! 
  }
  
  mutating func match() {
    score += 2
  }
  
  mutating func mismatch() {
    if score > 0 {
      score -= 1
    }
  }
  
  struct Card: Identifiable {
    var id: Int
    var isFaceUp: Bool
    var isMatched: Bool
    var wasSelected: Bool
    var content: CardContent
  }
}


