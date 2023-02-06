//
//  DebuggingApp.swift
//  Debugging
//
//  Created by Wolfpack Digital on 20.09.2022.
//

import SwiftUI

@main
struct DebuggingApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(DataStore())
        }
    }
}
