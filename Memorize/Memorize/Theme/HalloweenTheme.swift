//
//  HalloweenTheme.swift
//  Memorize
//
//  Created by Yaniv Hasbani on 08/08/2020.
//

import SwiftUI

struct HalloweenTheme: Theme {
  var numberOfCards: Int? = nil
  
  var name: String {
    "Halloween Theme"
  }
  
  var emojies: [String] {
    ["👻", "🎃", "🤡", "🎭"]
  }
  
  var color: Color {
    .orange
  }
}
