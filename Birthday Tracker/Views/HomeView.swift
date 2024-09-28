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
            VStack(spacing: 20) {
                // date picker
                CalendarView(currentDate: $currentDate)
            }
        }
        .environmentObject(ProfileViewModel())
    }
}

#Preview {
    HomeView().environmentObject(ProfileViewModel())
}
