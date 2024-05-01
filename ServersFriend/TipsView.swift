//
//  ContentView.swift
//  ServersFriend
//
//  Created by Jordan Snow on 4/30/24.
//

import SwiftUI

struct TipsView: View {
  var body: some View {
    NavigationStack {
      VStack {
        Image(systemName: "globe")
          .imageScale(.large)
          .foregroundStyle(.tint)
        Text("Hello from Tips!")
      }
      .padding()
      .navigationTitle("Tips Overview")
    }
  }
}

#Preview {
  TipsView()
}
