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
  @State private var navPath = NavigationPath()
//  @Query var shifts: [Shift]
  @Query var employers: [Employer]
  @Query var positions: [Position]
  @Query var shifts: [Shift]
  
//  let noNameMsg = Text("No name specified").font(.system(size: 12)).italic()

  var body: some View {
    NavigationStack {
      VStack {
        Text("Keep track of all of your job data here. Drag an object to the left to delete, and to the right to edit.")
          .padding(20)
        List {
          Section("My Employers"){
            ForEach(employers) { emp in
              NavigationLink(value: emp) {
                Text(emp.name)
              }
            }
            .onDelete(perform: deleteEmployer)
          }
          Section("My Positions"){
            ForEach(positions) { pos in
              NavigationLink(value: pos) {
                Text(pos.name)
              }
            }
            .onDelete(perform: deletePosition)
          }
          Section("My Shifts"){
            ForEach(shifts) { shift in
              NavigationLink(value: shift) {
                Text(shift.name)
              }
            }
            .onDelete(perform: deleteShift)
          }
        }
        .navigationTitle("Job Data")
        .navigationDestination(for: Employer.self) { emp in
          Text("Employer")
          emp.name.isEmpty ? Text("No name") : Text(emp.name)
        }
        .navigationDestination(for: Position.self) { pos in
          Text("Position")
        }
        .navigationDestination(for: Shift.self) { shift in
          Text("Shift")
        }
      }
    }
  }
  
//  func addShift() {
//    let newShift = Shift(name: "", hourlyWage: 0.00, tipIn: false, tipOut: false)
//    modelContext.insert(newShift)
//    path.append(newShift)
//  }
  
//  func deleteShift(at offsets: IndexSet) {
//    for offset in offsets {
//      let shift = shifts[offset]
//      modelContext.delete(shift)
//    }
//  }
  
  func deleteEmployer(at offsets: IndexSet) {
    for offset in offsets {
      let target = employers[offset]
      modelContext.delete(target)
    }
  }
  func deletePosition(at offsets: IndexSet) {
    for offset in offsets {
      let target = positions[offset]
      modelContext.delete(target)
    }
  }
  func deleteShift(at offsets: IndexSet) {
    for offset in offsets {
      let target = shifts[offset]
      modelContext.delete(target)
    }
  }
}

#Preview {
  ShiftsView()
}
