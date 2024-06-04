//
//  EmployerDataView.swift
//  ServersFriend
//
//  Created by Jordan Snow on 6/4/24.
//

import SwiftUI

struct EmployerDataView: View {
  @State var employer: Employer
  @State private var isShowingEdit = false
  
  var body: some View {
    VStack {
      Text("Data for \(employer.name)").bold()
      Spacer()
      Button("Change Settings for \(employer.name)") {
        isShowingEdit = true
      }
    }
    .sheet(isPresented: $isShowingEdit) {
      // TODO: maybe make this a modal instead of a sheet
      EditEmployerView(employer: employer)
    }
  }
}

#Preview {
  EmployerDataView(employer: Employer(name: "Bartender"))
}
