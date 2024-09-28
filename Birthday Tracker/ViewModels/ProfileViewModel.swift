//
//  ProfileViewModel.swift
//  Birthday Tracker
//
//  Created by Allison Fergason on 8/11/24.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    @Published var contacts: [ProfileModel] = [] {
        didSet {
            saveItems()
        }
    }
    let contactsKey: String = "contactsKey"
    
    init() {
        getContacts()
    }
    
    func getContacts() {
        
        let newItems = [
            ProfileModel(name: "first", birthday: getSampleDate(offset: -1)),
            ProfileModel(name: "second", birthday: getSampleDate(offset: 10)),
            ProfileModel(name: "third", birthday: getSampleDate(offset: 40))
        ]
        contacts.append(contentsOf: newItems)
        contacts = contacts.sorted(by: {
            $0.birthday.compare($1.birthday) == .orderedAscending
        })
        
        guard
            let data = UserDefaults.standard.data(forKey: contactsKey),
            let savedItems = try? JSONDecoder().decode([ProfileModel].self, from: data)
        else {
            return
        }
        
        self.contacts = savedItems
    }
    
    // add, delete, update
    func addContact(name: String, birthday: Date, age: Int? = nil, notifEnabled: Bool = true, notes: String = "") {
        let newContact = ProfileModel(name: name, birthday: birthday)
        contacts.append(newContact)
    }
    func updateContact(item: ProfileModel) {
//        if let index = items.firstIndex { (existingItem) -> Bool in
//            return existingItem.id == item.id
//        } {
//            // code
//        }
        if let index = contacts.firstIndex(where: { $0.id == item.id }) {
            contacts[index] = item.update()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(contacts) {
            UserDefaults.standard.set(encodedData, forKey: contactsKey)
        }
    }
    
    func isMonthEmpty(month: String) -> Bool {
        var exist = false
        for item in contacts {
            if item.getBirthMonth() == month {
                exist = true
                break
            }
        }
        return exist
    }
    
    func getDateList(date: Date) -> Array<ProfileModel> {
        var array: Array<ProfileModel> = Array()
        let calendar = Calendar.current
        for item in contacts {
            let date2 = item.birthday
            if (calendar.isDate(date, inSameDayAs: date2)) {
                array.append(item)
            }
        }
        return array
    }
    
    func getIndex(date: Date) -> Int {
        let sortedContacts = contacts.sorted { $0.birthday < $1.birthday }
        var index = 0
        var flag = false
        for item in sortedContacts {
            if item.birthday > date {
                flag = true
                break
            }
            index+=1
        }
        if flag == false {
            return 0
        }
        return index
    }
    
}

func getSampleDate (offset: Int) -> Date {
    let calendar = Calendar.current
    let date = calendar.date(byAdding: .day, value: offset, to: Date())
    return date ?? Date()
}
