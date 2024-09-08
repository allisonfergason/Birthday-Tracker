//
//  CountdownView.swift
//  Birthday Tracker
//
//  Created by Allison Fergason on 7/29/24.
//

import SwiftUI

struct CountdownView: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                Spacer()
                // get variables to count down
                Text("8")
                    .font(.custom("SFUIDisplay-Light", size: 120))
                Text("months")
                    .font(.title)
                Spacer()
                Text("6")
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
