//
//  CountdownView.swift
//  Birthday Tracker
//
//  Created by Allison Fergason on 7/29/24.
//

import SwiftUI

struct CountdownView: View {
    // add some kind of confetti or animation when the date is today
    
    let birthdayComponents = DateComponents(calendar: .current, month: 9, day: 14)
    var monthsLeft: Int
    var daysLeft: Int
    let monthsColor: Color
    let daysColor: Color
    let name: String
    let title: String
    
    init(profile: ProfileModel) {
        let today = Date().removeTimeStamp()
        name = profile.name
        var birthday = profile.birthday
        var earlier = birthday.todayEarlierThan(date: today)
        while (!earlier) {
            birthday = Calendar.current.date(byAdding: .month, value: 12, to: birthday)!
            earlier = birthday.todayEarlierThan(date: today)
        }
        monthsLeft = birthday.monthsFrom(from: today);
        let todayPlusMonths = Calendar.current.date(byAdding: .month, value: monthsLeft, to: today)!
        daysLeft = birthday.daysFrom(from: todayPlusMonths)
        monthsColor = monthsLeft==0 ? Color(#colorLiteral(red: 0.4500938654, green: 0.9813225865, blue: 0.4743030667, alpha: 1)) : Color(#colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1))
        daysColor = daysLeft==0 ? Color(#colorLiteral(red: 0.4500938654, green: 0.9813225865, blue: 0.4743030667, alpha: 1)) : Color(#colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1))
        title = "Countdown to "+"\(name)"+"'s birthday"
    }
    
    
    var body: some View {
            VStack {
                Spacer()
                Text(title)
                    .font(.title)
                    .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 3)
                Spacer()
                VStack {
                    Spacer()
                    Text("\(monthsLeft)")
                        .font(.custom("SFUIDisplay-Light", size: 120))
                    Text("months")
                        .font(.title)
                    Spacer()
                    Spacer()
                }
                .frame(width: 300, height: 200, alignment: .center)
                .background(monthsColor)
                .cornerRadius(40)
                .shadow(radius: 15)
                Spacer()
                VStack {
                    Spacer()
                    Text("\(daysLeft)")
                        .font(.custom("SFUIDisplay-Light", size: 120))
                    Text("days")
                        .font(.title)
                    Spacer()
                    Spacer()
                }
                .frame(width: 300, height: 200, alignment: .center)
                .background(daysColor)
                .cornerRadius(40)
                .shadow(radius: 15)
                Spacer()
                Spacer()
            }
            .padding(.vertical)
            .frame(minWidth: 600, minHeight: 600, alignment: .center)
            //.navigationTitle(title)
    }
}

#Preview {
    NavigationStack {
        CountdownView(profile: ProfileModel(name: "CC", birthday: getSampleDate(offset: 40)))
    }
}
