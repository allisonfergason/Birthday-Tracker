//
//  HomeView.swift
//  Birthday Tracker
//
//  Created by Edward Zhou on 8/10/24.
//

import SwiftUI

struct HomeView: View {
    
    @State var currentDate: Date = Date()
    @State var profileViewModel = ProfileViewModel()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            // date picker
            CalendarView(currentDate: $currentDate)
            //let p = print("home -> calendar")
        }
        .environmentObject(ProfileViewModel())
    }
}

#Preview {
    NavigationStack {
        HomeView()
    }
    .environmentObject(ProfileViewModel())
}
