//
//  TipEditView.swift
//  ServersFriend
//
//  Created by Jordan Snow on 4/30/24.
//

import SwiftUI

struct TipEditView: View {
  @Bindable var tip: Tip
  
  var body: some View {
    Form {
      Section {
        TextField("Cash Tips", text: cashTipsProxy)
        TextField("Credit Tips", text: creditTipsProxy)
        Divider()
        TextField("Tip In Amount", text: tipInAmountProxy)
        TextField("Tip Out Amount", text: tipOutAmountProxy)
      }
      Section("Shift") {
        // add shift functionality here (picker)
      }
      
    }
    .navigationTitle("Edit Tip")
    .navigationBarTitleDisplayMode(.inline)
  }
  
  var cashTipsProxy: Binding<String> {
    Binding<String>(
      get: { String(format: "%.02f", Double(tip.cashTips)) },
      set: {
        if let value = NumberFormatter().number(from: $0) {
          tip.cashTips = value.doubleValue
        }
      }
    )
  }
  var creditTipsProxy: Binding<String> {
    Binding<String>(
      get: { String(format: "%.02f", Double(tip.creditTips)) },
      set: {
        if let value = NumberFormatter().number(from: $0) {
          tip.creditTips = value.doubleValue
        }
      }
    )
  }
  var tipInAmountProxy: Binding<String> {
    Binding<String>(
      get: { String(format: "%.02f", Double(tip.tipInAmount)) },
      set: {
        if let value = NumberFormatter().number(from: $0) {
          tip.tipInAmount = value.doubleValue
        }
      }
    )
  }
  var tipOutAmountProxy: Binding<String> {
    Binding<String>(
      get: { String(format: "%.02f", Double(tip.tipOutAmount)) },
      set: {
        if let value = NumberFormatter().number(from: $0) {
          tip.tipOutAmount = value.doubleValue
        }
      }
    )
  }

}

//#Preview {
//  TipEditView()
//}
