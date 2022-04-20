//
//  TurnipOffApp.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 12/04/2022.
//

import SwiftUI

@main
struct TurnipOffApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationTitle("TurnipOff")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
