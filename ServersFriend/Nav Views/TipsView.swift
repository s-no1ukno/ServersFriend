//
//  ContentView.swift
//  ServersFriend
//
//  Created by Jordan Snow on 4/30/24.
//

import SwiftUI
import SwiftData

struct TipsView: View {
  
  @Environment(\.modelContext) var modelContext
  @State private var path = NavigationPath()
  @Query var tips: [Tip]
  
  var body: some View {
    NavigationStack(path: $path) {
      List {
        ForEach(tips) { tip in
          NavigationLink(value: tip) {
            Text(String(format: "%.2f", tip.cashTips))
          }
        }
      }
      .navigationTitle("Tips Overview")
      .navigationDestination(for: Tip.self) { tip in
        EditTipView(tip: tip, navPath: $path)
      }
      .toolbar {
        Button("Add Tip", systemImage: "plus", action: addTip)
      }
    }
  }
  
  func addTip() {
    let newTip = Tip(
      cashTips: 0,
      creditTips: 0,
      tipInAmount: 0,
      tipOutAmount: 0,
      date: Date()
    )
    modelContext.insert(newTip)
    path.append(newTip)
  }
}

#Preview {
  TipsView()
}
