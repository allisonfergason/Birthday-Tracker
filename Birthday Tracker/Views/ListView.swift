//
//  ListView.swift
//  Birthday Tracker
//
//  Created by Allison Fergason on 7/29/24.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                // add in foreach for the list of contacts
                ForEach (items) { item in
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
//let formatter = DateFormatter()
//DateFormatter.dateFormat(fromTemplate: "yyyy/MM/dd")
//let someDateTime = formatter.date(from: "2016/10/08")
var item3 = ListItemModel(name: "Allison Fergason", birthday: Date())
var item4 = ListItemModel(name: "Curtis Chung", birthday: Date())
var item5 = ListItemModel(name: "Curtis Chung", birthday: Date())
var item6 = ListItemModel(name: "Curtis Chung", birthday: Date())
var item7 = ListItemModel(name: "Curtis Chung", birthday: Date())
var item8 = ListItemModel(name: "Curtis Chung", birthday: Date())
var item9 = ListItemModel(name: "Curtis Chung", birthday: Date())
var item10 = ListItemModel(name: "Curtis Chung", birthday: Date())
var item11 = ListItemModel(name: "Curtis Chung", birthday: Date())
var item12 = ListItemModel(name: "Curtis Chung", birthday: Date())
var item13 = ListItemModel(name: "Curtis Chung", birthday: Date())
var item14 = ListItemModel(name: "Curtis Chung", birthday: Date())
var item15 = ListItemModel(name: "Curtis Chung", birthday: Date())

var items = [item3, item4, item5, item6, item7, item8, item9, item10, item11, item12, item13, item14, item15]

#Preview {
    ListView()
}
