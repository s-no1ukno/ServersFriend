//
//  Position.swift
//  ServersFriend
//
//  Created by Jordan Snow on 6/4/24.
//

import Foundation
import SwiftData

@Model
class Position {
  var name: String
  var wage: Double
  var employer: Employer
  
  init(name: String, wage: Double, employer: Employer) {
    self.name = name
    self.wage = wage
    self.employer = employer
  }
}
