//
//  Tip.swift
//  ServersFriend
//
//  Created by Jordan Snow on 4/30/24.
//

import Foundation
import SwiftData

@Model
class Tip {
  var cashTips: Double
  var creditTips: Double
  var tipInAmount: Double
  var tipOutAmount: Double
  var date: Date
  var shift: Shift?
  
  init(cashTips: Double, creditTips: Double, tipInAmount: Double,
       tipOutAmount: Double, date: Date, shift: Shift? = nil
  ) {
    self.cashTips = cashTips
    self.creditTips = creditTips
    self.tipInAmount = tipInAmount
    self.tipOutAmount = tipOutAmount
    self.date = date
    self.shift = shift
  }
}
