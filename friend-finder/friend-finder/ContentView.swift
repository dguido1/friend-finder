//
//  ContentView.swift
//  friend-finder
//
//  Created by David Guido on 10/7/19.
//  Copyright © 2019 csuf. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
 
    var body: some View {
        TabView(selection: $selection){
            Text("First View")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("first")
                        Text("First")
                    }
                }
                .tag(0)
            Text("Second View")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("second")
                        Text("Second")
                    }
                }
                .tag(1)
            Text("Third View")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("third")
                        Text("Third")
                    }
                }
                .tag(2)
            Text("Fourth View")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("fourth")
                        Text("Fourth")
                    }
                }
                .tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
