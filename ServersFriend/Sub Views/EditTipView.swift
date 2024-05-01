//
//  TipEditView.swift
//  ServersFriend
//
//  Created by Jordan Snow on 4/30/24.
//

import SwiftUI

struct EditTipView: View {
  @Bindable var tip: Tip
  
  var body: some View {
    Form {
      Section("Tip Info") {
        HStack {
          Text("Cash Tips")
          Divider()
          TextField("", value: $tip.cashTips, format: .currency(code: "USD"))
        }
        HStack {
          Text("Credit Tips")
          Divider()
          TextField("", value: $tip.creditTips, format: .currency(code: "USD"))
        }
        HStack {
          Text("Tip In Amount")
          Divider()
          TextField("", value: $tip.tipInAmount, format: .currency(code: "USD"))
        }
        HStack {
          Text("Tip Out Amount")
          Divider()
          TextField("", value: $tip.tipOutAmount, format: .currency(code: "USD"))
        }
      }
      .keyboardType(.decimalPad)
      
      Section("Total Income") {
        Text("Total Income Earned: $\(calcTotalAsString())")
      }
      
      Section("Shift") {
        // add shift functionality here (picker)
      }
      
    }
    .navigationTitle("Edit Tip")
    .navigationBarTitleDisplayMode(.inline)
  }
  
  func calcTotalAsString() -> String {
    let calculation = tip.cashTips + tip.creditTips - tip.tipInAmount - tip.tipOutAmount
    return String(format: "%.2f", calculation)
  }
  
}

//#Preview {
//  TipEditView()
//}
