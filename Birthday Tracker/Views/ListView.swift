//
//  ListView.swift
//  Birthday Tracker
//
//  Created by Allison Fergason on 7/29/24.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                // for each contact in your list
                ForEach (listViewModel.contacts) { item in
                    ListItemView(name: item.name, date: item.dateToString())
                }
            }
        }
        .navigationTitle("Birthdays")
        .padding(10)
    }
    
    @ViewBuilder
    func ListItemView(name: String, date: String) -> some View {
        let color: Color = .random
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
    .environmentObject(ListViewModel())
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
