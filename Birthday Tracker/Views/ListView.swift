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
                    HStack {
                        HStack(alignment: .center) {
                            Text(item.name)
                                .foregroundColor(Color.white)
                            Spacer(minLength: 150)
                            Text(item.dateToString())
                                .foregroundColor(Color.white)
                        }
                        .padding(.horizontal)
                        .frame(height:55)
                        .background(Color(#colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1)))
                        .cornerRadius(10)
                    }
                }
            }
        }
        .navigationTitle("Birthdays")
        .padding(10)
    }
}

#Preview {
    NavigationView {
        ListView()
    }
    .environmentObject(ListViewModel())
}
