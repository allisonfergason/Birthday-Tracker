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
    
    // make list items into buttons that lead to a profile, pass the profile model object to 
    
    var body: some View {
        ScrollView(.vertical) {
            ForEach(months, id: \.self) { month in
                isMonthEmpty(month: month)
                getMonthContacts(month: month)
            }
            
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color(#colorLiteral(red: 0.8692006469, green: 0.8692006469, blue: 0.8692006469, alpha: 1)))
                .padding(.vertical)
            // doesn't work??
            NavigationLink ("Add Contact", destination: ProfileEditorView())
                .foregroundColor(.white)
                .font(.headline)
                .frame(height: 55)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .background(Color(#colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1)))
                .cornerRadius(10)
        }
        .navigationTitle("Birthdays")
        .navigationBarItems(trailing: NavigationLink("Add Contact", destination: ProfileEditorView()))
        .padding(10)
    }
    
    @ViewBuilder
    func isMonthEmpty(month: String) -> some View {
        if (profileViewModel.isMonthEmpty(month: month)) {
            MonthHeaderView(month: month)
        }
    }
    
    @ViewBuilder
    func getMonthContacts(month: String) -> some View {
            VStack {
            ForEach(profileViewModel.contacts) { item in
                if item.getBirthMonth() == month {
                    ListItemView(item: item)
                }
            }
        }
    }
    
}

struct ListItemView: View {
    var contact: ProfileModel
    var name: String
    var date: String
    let color: Color = .random
    
    init(item: ProfileModel) {
        self.contact = item
        self.name = item.name
        self.date = item.dateToString()
    }
    
    var body: some View {
        NavigationLink(destination: ProfileView(profile: contact),
            label: {
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
            })
    }
}
struct MonthHeaderView: View {
    var month: String
    
    var body: some View {
        VStack {
            Text(month)
                .frame(maxWidth: .infinity)
                .foregroundColor(Color(#colorLiteral(red: 0.5723067522, green: 0.5723067522, blue: 0.5723067522, alpha: 1)))
                .textCase(.uppercase)
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color(#colorLiteral(red: 0.8692006469, green: 0.8692006469, blue: 0.8692006469, alpha: 1)))
        }
        .padding(.vertical)
    }
}

#Preview {
    NavigationView {
        ListView()
    }
    .environmentObject(ProfileViewModel())
}
