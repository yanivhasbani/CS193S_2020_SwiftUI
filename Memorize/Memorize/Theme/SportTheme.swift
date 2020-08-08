//
//  FaceTheme.swift
//  Memorize
//
//  Created by Yaniv Hasbani on 08/08/2020.
//

import SwiftUI

struct SportTheme: Theme {
  var name: String {
    "Sport Theme"
  }
  
  var emojies: [String] {
    ["🎱", "🏓", "🏈", "🏀", "⚽️", "🥎", "🏐", "🏒", "🥏", "🎽"]
  }
  
  var numberOfCards: Int? {
    emojies.count
  }
  
  var color: Color {
    .black
  }
}
