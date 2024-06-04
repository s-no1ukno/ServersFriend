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
  @Query(sort: [SortDescriptor(\Tip.date, order: .reverse)]) var tips: [Tip]
  
  var body: some View {
    NavigationStack(path: $path) {
      Section {
        HStack {
          Text("Diagram 1")
          Spacer()
          Text("Diagram 2")
        }
        .padding(.horizontal, 50)
        .frame(height: UIScreen.main.bounds.height / 3)
        .font(.caption)
      }
      
      Section {
        List {
          // TODO: Need to set up sorting/filtering here, to only grab tips within a certain date
          ForEach(tips) { tip in
            NavigationLink(value: tip) {
              
              VStack(alignment: .leading) {
                Text(tip.date, style: .date)
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

      }
      .navigationTitle("Tips Overview")
      .navigationDestination(for: Tip.self) { tip in
        EditTipView(tip: tip, navPath: $path)
      }
      .toolbar {
        Button("Delete All Data", systemImage: "trash.square.fill", action: deleteAll)
        Button("Add Tip", systemImage: "plus", action: addTip)
      }
    }
  }
  
  private func calcTotalTips(_ tip: Tip) -> Double {
    return tip.cashTips + tip.creditTips - tip.tipInAmount - tip.tipOutAmount
  }
  
  private func deleteAll() {
    modelContext.container.deleteAllData()
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
