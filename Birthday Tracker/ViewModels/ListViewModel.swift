//
//  ListViewModel.swift
//  Birthday Tracker
//
//  Created by Allison Fergason on 8/11/24.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var contacts: [ListItemModel] = [] {
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
            ListItemModel(name: "first", birthday: getSampleDate(offset: -1)),
            ListItemModel(name: "second", birthday: getSampleDate(offset: 9)),
            ListItemModel(name: "third", birthday: getSampleDate(offset: 15))
        ]
        contacts.append(contentsOf: newItems)
        
        guard
            let data = UserDefaults.standard.data(forKey: contactsKey),
            let savedItems = try? JSONDecoder().decode([ListItemModel].self, from: data)
        else {
            return
        }
        
        self.contacts = savedItems
    }
    
    // add, delete, update
    func addContact(name: String, birthday: Date) {
        let newContact = ListItemModel(name: name, birthday: birthday)
        contacts.append(newContact)
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(contacts) {
            UserDefaults.standard.set(encodedData, forKey: contactsKey)
        }
    }
}

func getSampleDate (offset: Int) -> Date {
    let calendar = Calendar.current
    let date = calendar.date(byAdding: .day, value: offset, to: Date())
    return date ?? Date()
}
