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
    @State var notifChanged: Bool
    var newProfile: Bool?
    
    init(profile: ProfileModel, newProfile: Bool? = false) {
        self.profile = profile
        self.notifEnabled = true
        self.name = profile.name
        self.birthday = profile.birthday
        self.notes = profile.notes
        self.notifChanged = false
        self.newProfile = newProfile
    }
    
    var body: some View {
        ScrollView {
            
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
                
                // updating notification does not work
                HStack(alignment: .center) {
                    Toggle("Notifications", isOn: $notifEnabled)
                        .foregroundStyle(.secondary)
                        .onTapGesture {
                            self.notifChanged = true
                        }
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
                
//                VStack(alignment: .leading, spacing: 10) {
//                    Text("Delete Contact")
//                        .font(.subheadline)
//                        .foregroundStyle(Color(Color.red))
//                }
//                .padding(.all)
//                .frame(maxWidth: .infinity, alignment: .center)
//                .background(.white)
//                .overlay(Divider()
//                    .frame(maxWidth: .infinity), alignment: .top)
//                .overlay(Divider()
//                    .frame(maxWidth: .infinity), alignment: .bottom)
//                // causing some issues, possible with the dismiss going back to a profileview that no longer exists
//                .onTapGesture {
//                    profileViewModel.deleteContact(item: profile)
//                    dismiss()
//                }
            }
            .padding(.vertical)
            .background(Color(red: 0.95, green: 0.95, blue: 0.95))
        }
        .padding(.top)
        .background(Color(red: 0.95, green: 0.95, blue: 0.95))

        // notes and notifenabled having issues saving, maybe something to do with them being optional and the default values
        .navigationBarItems(trailing: Button("Done") {
            if (newProfile == true) {
                profileViewModel.addContact(name: name, birthday: birthday, notifEnabled: notifEnabled, notes: notes)
            }
            if (notifChanged == true) {
                profileViewModel.updateContact(item: profile, name: name, birthday: birthday, notifEnabled: !notifEnabled, notes: notes)
            }
            else {
                profileViewModel.updateContact(item: profile, name: name, birthday: birthday, notifEnabled: notifEnabled, notes: notes)
            }
            dismiss()
        })
    }
}

#Preview {
    NavigationStack {
        ProfileEditorView(profile: ProfileModel(name: "CC", birthday: getSampleDate(offset: -1)))
    }
    .environmentObject(ProfileViewModel())
}
