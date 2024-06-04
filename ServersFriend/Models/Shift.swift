//
//  Shift.swift
//  ServersFriend
//
//  Created by Jordan Snow on 4/30/24.
//

import Foundation
import SwiftData

@Model
class Shift {
  // info
  var name: String
  
  // relationships
  var tips: [Tip]?
  var position: Position?
  
  init(name: String, tips: [Tip]? = nil, position: Position? = nil) {
    self.name = name
    self.tips = tips
    self.position = position
  }
}
