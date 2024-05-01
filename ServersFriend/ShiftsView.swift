//
//  ShiftsView.swift
//  ServersFriend
//
//  Created by Jordan Snow on 4/30/24.
//

import SwiftUI
import SwiftData

struct ShiftsView: View {
  
  @Environment(\.modelContext) var modelContext
  @State private var path = [Shift]()
  @Query var shifts: [Shift]
  
  var body: some View {
    NavigationStack(path: $path) {
      List {
        ForEach(shifts) { shift in
          NavigationLink(value: shift) {
            Text(shift.name)
          }
        }
        .onDelete(perform: deleteShift)
      }
      .navigationTitle("Shifts")
      .navigationDestination(for: Shift.self) { shift in
        EditShiftView(shift: shift)
      }
      .toolbar {
        Button("Add Shift", systemImage: "plus", action: addShift)
      }
    }
  }
  
  func addShift() {
    let newShift = Shift(name: "", hourlyWage: 0.00, tipIn: false, tipOut: false)
    modelContext.insert(newShift)
    path.append(newShift)
  }
  
  func deleteShift(at offsets: IndexSet) {
    for offset in offsets {
      let shift = shifts[offset]
      modelContext.delete(shift)
    }
  }
}

#Preview {
  ShiftsView()
}
