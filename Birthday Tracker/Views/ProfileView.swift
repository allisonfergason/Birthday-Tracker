//
//  ProfileView.swift
//  Birthday Tracker
//
//  Created by Allison Fergason on 7/29/24.
//

import SwiftUI

struct ProfileView: View {
    
    @State var notifEnabled = true
    var name: String = "Curtis Chung"
    var birthday: String = "September 12, 2004"
    var notes: [String] = ["Very very very short", "Um, actually"]
    
    var body: some View {
        VStack( spacing: 35 ) {
            HStack {
                Button {
                    withAnimation{
                       
                    }
                } label: {
                    Image(systemName: "chevron.left")
                }
                Spacer()
                Button {
                    withAnimation{
                        
                    }
                } label: {
                    Text("Edit")
                }
            }
            .padding(.horizontal)
            VStack( spacing: 35 ) {
                Circle()
                // fix the color thing
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
                    Text("69")
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
                    VStack(alignment: .leading) {
                        ForEach(notes, id: \.self) { note in
                            Text("- \(note)")
                        }
                    }
                    
                    Spacer()
                }
                .padding(.all)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.white)
                .cornerRadius(10)
                Spacer()
            }
            .padding(.all)
            .background(Color(red: 0.95, green: 0.95, blue: 0.95))
        }
        .padding(.top)
    }
}

#Preview {
    ProfileView()
}
