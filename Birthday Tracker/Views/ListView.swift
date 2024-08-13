//
//  ListView.swift
//  Birthday Tracker
//
//  Created by Allison Fergason on 7/29/24.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel
    let months: [String] = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    
    var body: some View {
        ScrollView(.vertical) {
            ForEach(months, id: \.self) { month in
                Spacer()
                Text(month)
                    .frame(maxWidth: .infinity)
                Rectangle()
                    .frame(height: 2)
                    .foregroundColor(.gray)
                getMonthContacts(month: month)
                .padding(.vertical)
            }
        }
        .navigationTitle("Birthdays")
        .padding(10)
    }
    
    @ViewBuilder
    func getMonthContacts(month: String) -> some View {
            VStack {
            ForEach(profileViewModel.contacts) { item in
                if item.getMonth() == month {
                    ListItemView(name: item.name, date: item.dateToString())
                }
            }
        }
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
            red: .random(in: 0...0.3),
            green: .random(in: 0...0.5),
            blue: .random(in: 0...1)
        )
    }
}
