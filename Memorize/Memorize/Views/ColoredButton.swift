//
//  ColoredButton.swift
//  Memorize
//
//  Created by Yaniv Hasbani on 08/08/2020.
//

import SwiftUI

struct ColoredButton: View {
  var text: String
  var textColor: Color
  var backgroundColor: Color
  var tapAction: ()->()
  var size: CGSize
  
  init(_ text: String,
       _ size: CGSize,
       _ textColor: Color,
       _ backgroundColor: Color,
       _ action: @escaping ()->()) {
    self.text = text
    self.size = size
    self.textColor = textColor
    self.backgroundColor = backgroundColor
    self.tapAction = action
  }
  
  var body: some View {
    Button(action: self.tapAction) {
      Text(text)
        .font(.system(size: size.width / 30))
        .padding()
        .foregroundColor(textColor)
        .background(RoundedRectangle(cornerRadius:8)
          .fill(backgroundColor))
    }
    .buttonStyle(PlainButtonStyle())
  }
}
