//
//  FaceTheme.swift
//  Memorize
//
//  Created by Yaniv Hasbani on 08/08/2020.
//

import SwiftUI

struct FoodTheme: Theme {
  var name: String {
    "Food Theme"
  }
  
  var emojies: [String] {
    ["🍎", "🍐", "🍊", "🍌", "🥯", "🍟", "🥩", "🍕", "🧁"]
  }
  
  var numberOfCards: Int? {
    emojies.count
  }
  
  var color: Color {
    .green
  }
}
