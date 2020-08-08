//
//  MemoryGame.swift
//  Memorize
//
//  Created by Yaniv Hasbani on 08/07/2020.
//

import Foundation

// Model
struct MemoryGame<CardContent> where CardContent: Equatable {
  var cards: Array<Card>
  var onlyCardFacingUpIndex: Int? {
    get { cards.indices.filter { cards[$0].isFaceUp }.only }
    set {
      for index in cards.indices {
        cards[index].isFaceUp = index == newValue
      }
    }
  }
  
  init(numberOfPairOfCards: Int, cardContentFactory: (Int) -> CardContent) {
    cards = Array<Card>()
    
    for pairIndex in 0..<numberOfPairOfCards {
      let cardContent = cardContentFactory(pairIndex)
      cards.append(Card(id: pairIndex * 2, isFaceUp: false,
                        isMatched: false, content: cardContent))
      cards.append(Card(id: pairIndex * 2 + 1, isFaceUp: false,
                        isMatched: false, content: cardContent))
    }
    
    cards.shuffle()
  }
  
  mutating func choose(_ card: Card) {
    print("card chosen: \(card)")
    
    if let chosenIndex = cards.firstIndex(matching: card),
         !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
      if let potentialMatchedIndex = onlyCardFacingUpIndex {
        if cards[chosenIndex].content == cards[potentialMatchedIndex].content {
          cards[chosenIndex].isMatched = true
          cards[potentialMatchedIndex].isMatched = true
        }
        onlyCardFacingUpIndex = nil
      } else {
        onlyCardFacingUpIndex = chosenIndex
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
  
  struct Card: Identifiable {
    var id: Int
    var isFaceUp: Bool
    var isMatched: Bool
    var content: CardContent
  }
}


