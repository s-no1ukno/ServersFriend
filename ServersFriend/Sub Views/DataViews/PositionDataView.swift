//
//  PositionDataView.swift
//  ServersFriend
//
//  Created by Jordan Snow on 6/4/24.
//

import SwiftUI

struct PositionDataView: View {
  @Binding var navPath: NavigationPath
  @State var position: Position
  @State private var isShowingEdit = false
  
  var body: some View {
    VStack {
      Text("Data for \(position.name)").bold()
      Spacer()
      Button("Change Settings for \(position.name)") {
        isShowingEdit = true
      }
    }
    .sheet(isPresented: $isShowingEdit) {
      // TODO: maybe make this a modal instead of a sheet
      EditPositionView(navPath: $navPath, position: position)
    }
  }
}

//#Preview {
//  PositionDataView(position: Position(name: "Bartender", wage: 12.99))
//}
