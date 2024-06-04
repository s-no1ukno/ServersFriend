//
//  Employer.swift
//  ServersFriend
//
//  Created by Jordan Snow on 6/4/24.
//

import Foundation
import SwiftData

@Model
class Employer {
  // info
  var name: String
  
  // relationships
  var positions: [Position]?
  
  init(name: String, positions: [Position]? = nil) {
    self.name = name
    self.positions = positions
  }
}
