//
//  TipEditView.swift
//  ServersFriend
//
//  Created by Jordan Snow on 4/30/24.
//

import SwiftUI
import SwiftData

struct EditTipView: View {
  @Environment(\.modelContext) var modelContext
  @Bindable var tip: Tip
  @Binding var navPath: NavigationPath
  
  @Query(sort: [
    SortDescriptor(\Shift.name),
  ]) var shifts: [Shift]
  
  var body: some View {
    Form {
      // FIXME: buggy behavior from the doubles here, typing and updating is erratic
      Section("Tips Earned") {
        HStack {
          Text("Cash Tips").font(.caption)
          TextField("", value: $tip.cashTips, format: .currency(code: "USD"))
          // TODO: Figure out how to get these to spread out, text far left, currency far right
        }
        HStack {
          Text("Credit Tips").font(.caption)
          TextField("", value: $tip.creditTips, format: .currency(code: "USD"))
        }
      }
      
      Section ("Shift Expenses") {
        HStack {
          Text("Tip In Amount").font(.caption)
          TextField("", value: $tip.tipInAmount, format: .currency(code: "USD"))
        }
        HStack {
          Text("Tip Out Amount").font(.caption)
          TextField("", value: $tip.tipOutAmount, format: .currency(code: "USD"))
        }
      }
      .keyboardType(.decimalPad)
      
      Section("Total Income") {
        Text("$\(calcTotalAsString())")
          .bold()
      }

      Section("Shift") {
        // add shift functionality here (picker)
        Picker("Shift", selection: $tip.shift) {
          Text("Unknown Shift")
            .tag(Optional<Shift>.none)

          if !shifts.isEmpty {
            Divider()
            ForEach(shifts) {shift in
              Text(shift.name)
                .tag(Optional(shift))
            }
          }
          
        }
        Button("Add A New Shift", action: addShift)
      }
      
      // TODO: Double check that this isn't overwriting on initial load
      Section("Date") {
        DatePicker("", selection: $tip.date, displayedComponents: .date)
          .datePickerStyle(.wheel)
      }
      
    }
    .navigationTitle("Edit Tip")
    .navigationBarTitleDisplayMode(.inline)
    .navigationDestination(for: Shift.self) {shift in
      EditShiftView(navPath: $navPath, shift: shift)
    }
  }
  
  func calcTotalAsString() -> String {
    let calculation = tip.cashTips + tip.creditTips - tip.tipInAmount - tip.tipOutAmount
    return String(format: "%.2f", calculation)
  }
  
  func addShift() {
    let newShift = Shift(name: "")
    modelContext.insert(newShift)
    navPath.append(newShift)
  }
}

//#Preview {
//  TipEditView()
//}
