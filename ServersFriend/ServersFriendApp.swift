//
//  ServersFriendApp.swift
//  ServersFriend
//
//  Created by Jordan Snow on 4/30/24.
//

import SwiftUI
import SwiftData

@main
struct ServersFriendApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
        .modelContainer(for: Shift.self)
    }
  }
}
