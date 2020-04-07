//
//  ContentView.swift
//  iampoor
//
//  Created by Ionut Vasile on 20/02/2020.
//  Copyright © 2020 Ionut Vasile. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("icon")
            HStack {
                Text("I am poor")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("iconColor"))
                Text(".")
                .font(.title)
                .fontWeight(.bold)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
