//
//  ProfileEditorView.swift
//  Birthday Tracker
//
//  Created by Allison Fergason on 7/29/24.
//

import SwiftUI

struct ProfileEditorView: View {
    
    @EnvironmentObject var profileViewModel: ProfileViewModel
    @Environment(\.dismiss) var dismiss
    @State var profile: ProfileModel
    @State var notifEnabled: Bool
    @State var name: String
    @State var notes: String
    @State var birthday = Date()
    
    // why is age missing in this one
    // need to add in use of update() function so the changes actually save
    
    init(profile: ProfileModel) {
        self.profile = profile
        self.notifEnabled = true
        self.name = profile.name
        self.birthday = profile.birthday
        self.notes = profile.notes
    }
    
    var body: some View {
        VStack( spacing: 35 ) {
        
            VStack( spacing: 35 ) {
                Circle()
                    .fill(Color.random)
                    .frame(width: 256, height: 256)
                    TextField("Name", text: $name)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .padding(.all)
                        .multilineTextAlignment(.center)
                        .background(.white)
                        .autocorrectionDisabled(true)
                        .overlay(Divider()
                            .frame(maxWidth: .infinity), alignment: .top)
                        .overlay(Divider()
                            .frame(maxWidth: .infinity), alignment: .bottom)
               
            }
            VStack( alignment: .leading, spacing: 10 ) {
                DatePicker(
                    "Birthday",
                    selection: $birthday,
                    displayedComponents: [.date]
                )
                .foregroundStyle(.secondary)
                .padding(.horizontal)
                .frame(height: 55)
                .background(.white)
                .overlay(Divider()
                    .frame(maxWidth: .infinity), alignment: .top)
                .overlay(Divider()
                    .frame(maxWidth: .infinity), alignment: .bottom)
                
                HStack(alignment: .center) {
                    Toggle("Notifications", isOn: $notifEnabled)
                        .foregroundStyle(.secondary)
                }
                .padding(.horizontal)
                .frame(height: 55)
                .background(.white)
                .overlay(Divider()
                    .frame(maxWidth: .infinity), alignment: .top)
                .overlay(Divider()
                    .frame(maxWidth: .infinity), alignment: .bottom)

                VStack(alignment: .leading, spacing: 10) {
                    Text("Notes")
                        .foregroundStyle(.secondary)
                    TextEditor(text: $notes)
                        .frame(height: 60)
                        .onTapGesture {}
                
                    Spacer()
                }
                .padding(.all)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.white)
                .overlay(Divider()
                    .frame(maxWidth: .infinity), alignment: .top)
                .overlay(Divider()
                    .frame(maxWidth: .infinity), alignment: .bottom)

                Spacer()
            }
            .padding(.vertical)
            .background(Color(red: 0.95, green: 0.95, blue: 0.95))
        }
        .padding(.top)
        .background(Color(red: 0.95, green: 0.95, blue: 0.95))
        // add in button actions the stuff needed to save changes - when they press done changes are saved, when they press back they are not saved
        // this button and the one in list view will not work unless you start from another view- when testing any of the nav just start from calendar view
        .navigationBarItems(trailing: Button("Done") {
            profileViewModel.updateContact(item: profile, name: name, birthday: birthday, notifEnabled: notifEnabled, notes: notes)
            dismiss()
        })
    }
}

#Preview {
    NavigationView {
        ProfileEditorView(profile: ProfileModel(name: "CC", birthday: getSampleDate(offset: -1)))
    }
    .environmentObject(ProfileViewModel())
}
