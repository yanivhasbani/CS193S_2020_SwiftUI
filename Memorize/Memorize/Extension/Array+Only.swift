//
//  Array+Only.swift
//  Memorize
//
//  Created by Yaniv Hasbani on 07/08/2020.
//

import Foundation

extension Array {
  var only: Element? {
    count == 1 ? first : nil
  }
}
