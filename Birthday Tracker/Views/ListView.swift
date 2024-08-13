//
//  ListView.swift
//  Birthday Tracker
//
//  Created by Allison Fergason on 7/29/24.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                // for each contact in your list
                ForEach (profileViewModel.contacts) { item in
                    ListItemView(name: item.name, date: item.dateToString())
                }
            }
        }
        .navigationTitle("Birthdays")
        .padding(10)
    }
}

struct ListItemView: View {
    var name: String
    var date: String
    let color: Color = .random
    
    var body: some View {
        HStack(alignment: .center) {
            Text(name)
                .foregroundColor(Color.white)
            Spacer(minLength: 150)
            Text(date)
                .foregroundColor(Color.white)
        }
        .padding(.horizontal)
        .frame(height:55)
        .background(color)
        .cornerRadius(10)
    }
}

#Preview {
    NavigationView {
        ListView()
    }
    .environmentObject(ProfileViewModel())
}

extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}
