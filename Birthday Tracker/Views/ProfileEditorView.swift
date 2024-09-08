//
//  ProfileEditorView.swift
//  Birthday Tracker
//
//  Created by Allison Fergason on 7/29/24.
//

import SwiftUI

struct ProfileEditorView: View {
    
    @State var notifEnabled = true
    @State var name: String = "Curtis Chung"
    @State var notes: String = "- Very very very short \n- Um, actually"
    @State var birthday = Date()
    
    var body: some View {
        VStack( spacing: 35 ) {
            
            // TODO: Fix navigation
            HStack {
                Spacer()
                Button {
                    withAnimation{
                        
                    }
                } label: {
                    Text("Done")
                }
            }
            .padding(.horizontal)
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
    }
}

#Preview {
    ProfileEditorView()
}
