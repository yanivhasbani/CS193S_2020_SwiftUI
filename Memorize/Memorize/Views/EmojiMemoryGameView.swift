//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Yaniv Hasbani on 08/07/2020.
//

import SwiftUI

// View
struct EmojiMemoryGameView: View {
  // Indicates that viewModel has a var with @Published
  @ObservedObject var viewModel: EmojiMemoryGame
  
  var body: some View {
    Grid(viewModel.cards) { card in
      CardView(card: card).onTapGesture {
        viewModel.choose(card)
      }
      .padding(5)
    }
    .padding()
    .foregroundColor(.orange)
  }
}

struct CardView: View {
  var card: MemoryGame<String>.Card
  
  var body: some View {
    GeometryReader { geometry in
      return body(for: geometry.size )
    }
  }
  
  func body(for size: CGSize) -> some View {
    ZStack {
      if card.isFaceUp {
        RoundedRectangle(cornerRadius: cornerRadiusSize).fill(Color.white)
        RoundedRectangle(cornerRadius: cornerRadiusSize)
          .stroke(lineWidth: edgeLineWidth)
        Text(card.content)
      } else {
        if !card.isMatched {
          RoundedRectangle(cornerRadius: cornerRadiusSize)
            .fill()
        }
      }
    }
//    .frame(width: proportionalSize(size).width,
//           height: proportionalSize(size).height, alignment: .center)
    .font(fontSize(size: size))
  }
  
  // MARK: - Drawing Constants
  let cornerRadiusSize: CGFloat = 10.0
  let edgeLineWidth: CGFloat = 3
  func fontSize(size: CGSize) -> Font {
    return Font.system(size: min(size.width, size.height) * 0.75)
  }
  
  func proportionalSize(_ size:CGSize) -> CGSize {
    var height = size.width
    var width = size.height
    if width < height {
      height = width * 2 / 3
    } else {
      width = height * 2 / 3
    }
    
    return CGSize(width: width, height: height)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
  }
}
