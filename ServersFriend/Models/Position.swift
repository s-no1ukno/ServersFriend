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
  // info
  var name: String
  var wage: Double
  
  //relationships
  var employer: Employer?
  var shifts: [Shift]?
  
  init(name: String, wage: Double, employer: Employer? = nil, shifts: [Shift]? = nil) {
    self.name = name
    self.wage = wage
    self.employer = employer
    self.shifts = shifts
  }
}
