//
//  Birthday_TrackerApp.swift
//  Birthday Tracker
//
//  Created by Allison Fergason on 7/29/24.
//

import SwiftUI

@main
struct Birthday_TrackerApp: App {
    @State var profileViewModel = ProfileViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
            }
            .environmentObject(ProfileViewModel())
        }
    }
}
