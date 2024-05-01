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
  var name: String
  var hourlyWage: Double
  var tipIn: Bool
  var tipOut: Bool
  var tips: [Tip]?
  
  init(name: String, hourlyWage: Double, tipIn: Bool, tipOut: Bool, tips: [Tip]? = nil) {
    self.name = name
    self.hourlyWage = hourlyWage
    self.tipIn = tipIn
    self.tipOut = tipOut
    self.tips = tips
  }
}
