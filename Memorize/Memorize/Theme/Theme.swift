//
//  Theme.swift
//  Memorize
//
//  Created by Yaniv Hasbani on 08/08/2020.
//

import SwiftUI

protocol Theme {
  var name: String { get }
  var emojies: [String] { get }
  var numberOfCards: Int? { get }
  var color: Color { get }
}

extension Theme {
  var randomNumberOfCards: Int {
    let randomNumber = Int(arc4random()) % emojies.count
    if randomNumber == 0 {
      return emojies.count
    }
    
    return randomNumber
  }
}
