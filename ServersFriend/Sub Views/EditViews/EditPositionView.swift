//
//  EditPositionView.swift
//  ServersFriend
//
//  Created by Jordan Snow on 6/4/24.
//

import SwiftUI
import SwiftData

struct EditPositionView: View {
  @Environment(\.modelContext) var modelContext
  @Binding var navPath: NavigationPath
  
  @Bindable var position: Position
  @Query(sort: [
    SortDescriptor(\Employer.name),
  ]) var employers: [Employer]

  var body: some View {
    Form {
      Section {
        TextField("Name of Position", text: $position.name)
          .textContentType(.name)
      }
      Section {
        // TODO: Hook up this functionality
        Text("Hourly Wage")
//        TextField("Hourly Wage", text: $position.wage)
//          .textContentType(.name)
      }
      // Employer Dropdown
      Section("Employer") {
        Picker("Employer", selection: $position.employer) {
          Text("Unknown Employer")
            .tag(Optional<Position>.none)

          if !employers.isEmpty {
            Divider()
            ForEach(employers) {emp in
              Text(emp.name)
                .tag(Optional(emp))
            }
          }
          
        }
        Button("Add A New Employer", action: addEmployer)
      }
    }
    .navigationTitle("Edit Shift")
    .navigationBarTitleDisplayMode(.inline)
    .navigationDestination(for: Employer.self) {emp in
      EditEmployerView(employer: emp)
    }
  }
  
  func addEmployer() {
    let newEmployer = Employer(name: "")
    modelContext.insert(newEmployer)
    navPath.append(newEmployer)
  }
}

//#Preview {
//    EditPositionView()
//}
