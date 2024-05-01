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
            
            VStack(alignment: .leading) {
              // TODO: Figure out date formatting here
              //              Text(DateFormatter())
              Text("Wed, Sep 12 2024")
                .font(.caption)
                .padding(.bottom, 10)
              
              HStack {
                Text("$\(String(format: "%.2f", calcTotalTips(tip)))")
                  .font(.headline)
                
                Spacer()
                
                Text(tip.shift?.name ?? "Unknown Shift")
                  .font(.caption)
              }
            }
          }
        }
        .onDelete(perform: deleteTip)
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
  
  private func calcTotalTips(_ tip: Tip) -> Double {
    return tip.cashTips + tip.creditTips - tip.tipInAmount - tip.tipOutAmount
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
  func deleteTip(at offsets: IndexSet) {
    for offset in offsets {
      let tip = tips[offset]
      modelContext.delete(tip)
    }
  }
}

#Preview {
  TipsView()
}
