//
//  EditShiftView.swift
//  ServersFriend
//
//  Created by Jordan Snow on 4/30/24.
//

import SwiftUI
import SwiftData

struct EditShiftView: View {
  @Environment(\.modelContext) var modelContext
  @Binding var navPath: NavigationPath

  // @Bindable wrapper will allow something that's NOT state to be bound
  @Bindable var shift: Shift
  @Query(sort: [
    SortDescriptor(\Position.name),
    SortDescriptor(\Position.wage)
  ]) var positions: [Position]

  var body: some View {
    // 
    Form {
      Section {
        TextField("Name of Shift", text: $shift.name)
          .textContentType(.name)
      }
      // Position Dropdown
      Section("Position") {
        // add shift functionality here (picker)
        Picker("Position", selection: $shift.position) {
          Text("Unknown Position")
            .tag(Optional<Shift>.none)

          if !positions.isEmpty {
            Divider()
            ForEach(positions) {pos in
              Text(pos.name)
                .tag(Optional(pos))
            }
          }
          
        }
        Button("Add A New Position", action: addPosition)
      }
    }
    .navigationTitle("Edit Shift")
    .navigationBarTitleDisplayMode(.inline)
    .navigationDestination(for: Position.self) {pos in
      EditPositionView(navPath: $navPath, position: pos)
    }
  }
  
  func addPosition() {
    let newPosition = Position(name: "", wage: 0.00)
    modelContext.insert(newPosition)
    navPath.append(newPosition)
  }
}

//#Preview {
//  EditShiftView()
//}
