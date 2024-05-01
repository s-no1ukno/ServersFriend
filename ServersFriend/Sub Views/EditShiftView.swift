//
//  EditShiftView.swift
//  ServersFriend
//
//  Created by Jordan Snow on 4/30/24.
//

import SwiftUI

struct EditShiftView: View {
  // @Bindable wrapper will allow something that's NOT state to be bound
  @Bindable var shift: Shift
  
  var body: some View {
    Form {
      Section {
        TextField("Name of Shift", text: $shift.name)
          .textContentType(.name)
        
        // TODO: Add hourly wage here
      }
    }
    .navigationTitle("Edit Shift")
    .navigationBarTitleDisplayMode(.inline)
  }
}

//#Preview {
//  EditShiftView()
//}
