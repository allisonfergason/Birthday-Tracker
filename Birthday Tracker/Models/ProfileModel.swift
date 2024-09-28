//
//  ProfileModel.swift
//  Birthday Tracker
//
//  Created by Allison Fergason on 7/29/24.
//

import Foundation

struct ProfileModel: Identifiable, Codable {
    let name: String
    let birthday: Date
    let id: String
    let age: Int?
    let notifEnabled: Bool
    let notes: String
    
    init(id: String = UUID().uuidString, name: String, birthday: Date, age: Int? = nil, notifEnabled: Bool = true, notes: String = "") {
        self.id = id
        self.name = name
        self.birthday = birthday
        self.age = age
        self.notifEnabled = notifEnabled
        self.notes = notes
    }
    
    func dateToString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "M/d"
        return formatter.string(from: birthday)
    }
    
    func update() -> ProfileModel {
        return ProfileModel(id: id, name: name, birthday: birthday, age: age, notifEnabled: notifEnabled, notes: notes)
    }
    func getBirthMonth() -> String {
        return birthday.getMonthName()
    }
}
