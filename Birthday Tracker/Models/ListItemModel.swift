//
//  ListItemModel.swift
//  Birthday Tracker
//
//  Created by Allison Fergason on 8/10/24.
//

import Foundation

struct ListItemModel: Identifiable, Codable {
    let name: String
    let birthday: Date
    let id: String
    
    init(id: String = UUID().uuidString, name: String, birthday: Date) {
        self.id = id
        self.name = name
        self.birthday = birthday
    }
    
    func dateToString() -> String {
        let date = Date.now
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: date)
    }
}
