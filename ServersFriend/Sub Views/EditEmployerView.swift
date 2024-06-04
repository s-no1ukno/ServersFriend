//
//  EditEmployerView.swift
//  ServersFriend
//
//  Created by Jordan Snow on 6/4/24.
//

import SwiftUI
import SwiftData

struct EditEmployerView: View {
  
  @Bindable var employer: Employer

  var body: some View {
    Form {
      Section {
        TextField("Name of Employer", text: $employer.name)
          .textContentType(.name)
      }
    }
    .navigationTitle("Edit Employer")
    .navigationBarTitleDisplayMode(.inline)
  }
}

//#Preview {
//    EditPositionView()
//}
