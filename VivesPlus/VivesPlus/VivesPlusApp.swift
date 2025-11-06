//
//  VivesPlusApp.swift
//  VivesPlus
//
//  Created by Robin Roelandt on 04/11/2025.
//

import SwiftUI

@main
struct VivesPlusApp: App {
    @State var uurroosterDataStore = UurroosterDataStore()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(uurroosterDataStore)
                .tint(.red)
        }
    }
}
