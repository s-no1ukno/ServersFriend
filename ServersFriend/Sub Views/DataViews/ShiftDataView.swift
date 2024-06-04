//
//  ShiftDataView.swift
//  ServersFriend
//
//  Created by Jordan Snow on 6/4/24.
//

import SwiftUI

struct ShiftDataView: View {
  @State var shift: Shift
  
  var body: some View {
    Text("Shift Data for \(shift.name)").bold()
    Divider()
  }
}

#Preview {
  ShiftDataView(shift: Shift(name: "PM 1"))
}
