//
//  ContentView.swift
//  ServersFriend
//
//  Created by Jordan Snow on 4/30/24.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    TabView {
      
      TipsView()
        .tabItem {
          Label("Home", systemImage: "house")
        }

      CalendarNavView()
        .tabItem {
          Label("Calendar", systemImage: "calendar.badge.clock")
        }

      ShiftsView()
        .tabItem {
          Label("Shifts", systemImage: "pencil.line")
        }
      
      SettingsView()
        .tabItem {
          Label("Settings", systemImage: "gearshape")
        }
      
    }
  }
}

#Preview {
  ContentView()
}
