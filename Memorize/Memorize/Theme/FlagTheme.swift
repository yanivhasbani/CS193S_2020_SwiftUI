//
//  FaceTheme.swift
//  Memorize
//
//  Created by Yaniv Hasbani on 08/08/2020.
//

import SwiftUI

struct FlagTheme: Theme {
  var name: String {
    "Flag Theme"
  }
  
  var emojies: [String] {
    ["🇦🇷", "🏴", "🏁", "🇧🇷", "🇻🇬",
     "🇨🇳", "🇨🇺", "🇪🇨", "🇮🇱", "🇮🇹",
     "🇲🇰", "🇬🇧", "🇺🇸", "🇺🇾", "🇺🇦",
     "🇹🇷", "🇨🇭", "🇪🇸", "🇸🇰", "🇷🇴"]
  }
  
  var numberOfCards: Int? {
    emojies.count
  }
  
  var color: Color {
    Color(red: 100 / 255, green: 20 / 255, blue: 200 / 255)
  }
}
