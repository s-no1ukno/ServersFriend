//
//  ContentView.swift
//  ServersFriend
//
//  Created by Jordan Snow on 4/30/24.
//

import SwiftUI

struct TipsView: View {
  
  @Environment(\.modelContext) var modelContext
//  @State private var path = [Tip]()
//  @Query var tips: [Tip]
  
  var body: some View {
    NavigationStack {
      List {
        ForEach((0...10), id: \.self) {
          Text("\($0)...")
        }
      }
      .navigationTitle("Tips Overview")
    }
  }
}

#Preview {
  TipsView()
}
