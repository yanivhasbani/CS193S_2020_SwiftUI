//
//  FaceTheme.swift
//  Memorize
//
//  Created by Yaniv Hasbani on 08/08/2020.
//

import SwiftUI

struct FaceTheme: Theme {
  var name: String {
    "Face Theme"
  }
  
  var emojies: [String] {
    ["😄", "😢", "😍", "😷", "🤕", "🥺"]
  }
  
  var numberOfCards: Int? {
    emojies.count
  }
  
  var color: Color {
    .purple
  }
}
