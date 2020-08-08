//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Yaniv Hasbani on 08/07/2020.
//

import SwiftUI

@main
struct MemorizeApp: App {
  var body: some Scene {
    WindowGroup {
      let game = EmojiMemoryGame()
      EmojiMemoryGameView(viewModel: game)
    }
  }
}

struct MemorizeApp_Previews: PreviewProvider {
  static var previews: some View {
    /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
  }
}
