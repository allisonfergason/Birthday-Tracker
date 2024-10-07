//
//  CountdownView.swift
//  Birthday Tracker
//
//  Created by Allison Fergason on 7/29/24.
//

import SwiftUI

struct CountdownView: View {
    
    let birthdayComponents = DateComponents(calendar: .current, month: 9, day: 14)
    var monthsLeft: Int
    var daysLeft: Int
    init() {
        let today = Date().removeTimeStamp()
        let nextBirthday = Calendar.current.nextDate(after: today, matching: birthdayComponents, matchingPolicy: .nextTime)!
        monthsLeft = nextBirthday.monthsFrom(from: today);
        let todayPlusMonths = Calendar.current.date(byAdding: .month, value: monthsLeft, to: today)!
        daysLeft = nextBirthday.daysFrom(from: todayPlusMonths)
    }
    
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                Spacer()
                // get variables to count down
                // add some colored boxes or something for the background
                Text("\(monthsLeft)")
                    .font(.custom("SFUIDisplay-Light", size: 120))
                Text("months")
                    .font(.title)
                Spacer()
                Text("\(daysLeft)")
                    .font(.custom("SFUIDisplay-Light", size: 120))
                Text("days")
                    .font(.title)
                Spacer()
            }
            .padding(.vertical)
            .frame(minWidth: 600, minHeight: 600, alignment: .center)
            //.background(Color(.blue))
        }
        // change title?
        .navigationTitle("Countdown")
    }
}

#Preview {
    NavigationView {
        CountdownView()
    }
}
