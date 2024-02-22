//
//  friendfaceApp.swift
//  friendface
//
//  Created by Godwin IE on 20/02/2024.
//

import SwiftData
import SwiftUI

@main
struct friendfaceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
