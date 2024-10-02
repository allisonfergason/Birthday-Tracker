//
//  ProfileView.swift
//  Birthday Tracker
//
//  Created by Allison Fergason on 7/29/24.
//

import SwiftUI

struct ProfileView: View {
    // add countdown button somewhere in here
    @EnvironmentObject var profileViewModel: ProfileViewModel
    @Environment(\.dismiss) var dismiss
    @State var profile: ProfileModel
    @State var notifEnabled: Bool
    var name: String
    var birthday: String
    var notes: String
    var age: String
    
    init(profile: ProfileModel) {
        self.profile = profile
        self.notifEnabled = profile.notifEnabled
        self.name = profile.name
        
        // how to convert date to better looking string
        self.birthday = profile.dateToString()
        self.notes = profile.notes
        // fix age
        self.age = "69"
    }
    
    var body: some View {
        ScrollView {
            VStack( spacing: 35 ) {
                VStack( spacing: 35 ) {
                    Circle()
                        .fill(Color.random)
                        .frame(width: 256, height: 256)
                    Text(name)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }
                VStack( alignment: .leading, spacing: 10 ) {
                    HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                        Text("Birthday")
                            .foregroundStyle(.secondary)
                        Spacer()
                        Text(birthday)
                    }
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(.white)
                    .cornerRadius(10)
                    HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                        Text("Age")
                            .foregroundStyle(.secondary)
                        Spacer()
                        // fix this to actually calculate age
                        Text(age)
                    }
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(.white)
                    .cornerRadius(10)
                    HStack(alignment: .center) {
                        Toggle("Notifications", isOn: $notifEnabled)
                            .foregroundStyle(.secondary)
                    }
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(.white)
                    .cornerRadius(10)
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Notes")
                            .foregroundStyle(.secondary)
                        Text(notes)
                        Spacer()
                    }
                    .padding(.all)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.white)
                    .cornerRadius(10)
                    
                    // delete function was not working in editor view, here for now
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Delete Contact")
                            .font(.subheadline)
                            .foregroundStyle(Color(Color.red))
                        Spacer()
                    }
                    .padding(.all)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(.white)
                    .cornerRadius(10)
                    .onTapGesture {
                        profileViewModel.deleteContact(item: profile)
                        dismiss()
                    }
                    Spacer()
                    Spacer()
                    Spacer()
                }
                .padding(.all)
                .background(Color(red: 0.95, green: 0.95, blue: 0.95))
            }
            .padding(.top)
        }
        .navigationBarItems(trailing: NavigationLink("Edit", destination: ProfileEditorView(profile: profile)))
    }
    
}
#Preview {
    NavigationView {
        ProfileView(profile: ProfileModel(name: "CC", birthday: getSampleDate(offset: -1)))
    }
    .environmentObject(ProfileViewModel())
}
