//
//  DateValueModel.swift
//  Birthday Tracker
//
//  Created by Edward Zhou on 8/10/24.
//

import Foundation

struct DateValue: Identifiable {
    var id = UUID().uuidString
    var day: Int
    var date: Date
}
