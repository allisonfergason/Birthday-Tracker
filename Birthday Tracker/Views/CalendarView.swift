//
//  Calendar.swift
//  Birthday Tracker
//
//  Created by Allison Fergason on 7/29/24.
//

import SwiftUI

struct CalendarView: View {
    
    @Binding var currentDate: Date
    @EnvironmentObject var profileViewModel: ProfileViewModel

    
    // calendar view not loading changes to contacts as they are being made, or just not changing them at all
    
    // Month update on arrow button clicks
    @State var currentMonth: Int = 0
    
    var body: some View {
            VStack(spacing: 35) {
                let days: [String] =
                    ["Sun", "Mon", "Tue", "Wed", "Thu","Fri","Sat"]
                
                HStack(spacing: 20) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(extraData()[1])
                            .font(.caption)
                            .fontWeight(.semibold)
                        
                        Text(extraData()[0])
                            .font(.title.bold())
                    }
                    
                    Spacer(minLength: 0)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        NavigationLink(value: 1) {
                            Text("List View")
                        }
                        HStack {
                            Button {
                                withAnimation{
                                    currentMonth -= 1
                                }
                            } label: {
                                Image(systemName: "chevron.left")
                            }
                            Button {
                                withAnimation{
                                    currentMonth += 1
                                }
                            } label: {
                                Image(systemName: "chevron.right")
                            }
                        }
                    }
                }
                .padding(.horizontal)
                .navigationDestination(for: Int.self) { value in
                    ListView(profileViewModel: _profileViewModel) }
                
                HStack(spacing: 0) {
                    ForEach(days,id: \.self){ day in
                        Text(day)
                            .font(.callout)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                    }
                }
                
                let columns = Array(repeating: GridItem(.flexible()), count: 7)
                
                LazyVGrid(columns: columns, spacing: 15) {
                    ForEach(extractDate()) {value in
                        CardView( value: value)
                            .background(
                                Capsule()
                                    .fill(.pink)
                                    .padding(.horizontal, 8)
                                    .opacity(isSameDay(date1: value.date, date2: currentDate) ? 1 : 0)
                            )
                            .onTapGesture {
                                currentDate = value.date
                            }
                    }
                }
                
                VStack(spacing: 20) {
                    if let contact = profileViewModel.contacts.first(where: { contact in
                        return isSameDay(date1: contact.birthday, date2: currentDate)
                    }) {
                        let selectedDate = Calendar.current.dateComponents([.day, .month], from: contact.birthday)
                        let todayArray = profileViewModel.getDateList(date: contact.birthday)
                        Text("Birthdays on \(selectedDate.month!)/\(selectedDate.day!)")
                            .font(.title2.bold())
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        
                        ForEach(todayArray) { item in
                            ListItemView(item: item)
                        }
                    } else {
                        Text("Upcoming Birthdays")
                            .font(.title2.bold())
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        
                        // find upcoming
                        let nextIndex = profileViewModel.getIndex(date: currentDate);
                        let comingDates =
                        
                        // loops around to beginning of year if necessary
                        if nextIndex >= profileViewModel.contacts.count-1 {
                            [profileViewModel.contacts[nextIndex], profileViewModel.contacts[0]]
                        } else {
                            Array(profileViewModel.contacts[nextIndex...nextIndex+1])
                        }
                        
                        if comingDates.isEmpty {
                            Text("Some birthdays found")
                        }
                        ForEach(comingDates) { contact in
                            ListItemView(item: contact)
                        }
                    }
                }
                .padding()
                .padding(.top, 10)
            }.onChange(of: currentMonth) {
                // update Month
                currentDate = getCurrentMonth()
            }
    }
    
    @ViewBuilder
    func CardView(value: DateValue) -> some View {
        VStack {
            if value.day != -1 {
                if let contact = profileViewModel.contacts.first(where: { contact in
                    
                    return isSameDay(date1: contact.birthday, date2: value.date)
                }) {
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(isSameDay(date1: contact.birthday, date2: currentDate) ? .white : .primary)
                        .frame(maxWidth: .infinity)
                    Spacer()
                    Circle()
                        .fill(isSameDay(date1: contact.birthday, date2: currentDate) ? .white : .pink)
                        .frame(width: 8, height: 8)
                } else {
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(isSameDay(date1: value.date, date2: currentDate) ? .white : .primary)
                        .frame(maxWidth: .infinity)
                    Spacer()
                }
            }
        }
        .padding(.vertical, 9)
        .frame(height: 60, alignment: .top)
    }
    
    func isSameDay(date1: Date, date2: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(date1, inSameDayAs: date2)
    }
    
    func extraData() -> [String] {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM YYYY"
        let date = formatter.string(from: currentDate)
        return date.components(separatedBy: " ")
    }
    
    func getCurrentMonth() -> Date {
        // get current month date
        let calendar = Calendar.current
        
        // offset month by currentMonth state
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date()) else {
            return Date()
        }
        
        // return date as DateValue
        return currentMonth
    }
    
    func extractDate() -> [DateValue]{
        // get current month date
        let calendar = Calendar.current
        
        // offset month by currentMonth state
        let currentMonth = getCurrentMonth()
        
        // return date as DateValue
        var days = currentMonth.getAllDates().compactMap { date -> DateValue in
        
            let day = calendar.component(.day, from: date)
            return DateValue(day: day, date: date)
        }
        
        // adding offset days to get weekday
        let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? Date())
        
        for _ in 0..<firstWeekday-1 {
            days.insert(DateValue(day: -1, date: Date()), at: 0)
        }
        
        return days
    }
}

#Preview {
    NavigationStack {
        HomeView()
    }
    .environmentObject(ProfileViewModel())
}
