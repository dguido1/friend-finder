    //
    //  ContentView.swift
    //
    //  Friend Finder, CPSC 362, M/W: 11:00am-12:50pm
    //  CSUF Fall 2019
    //
    //  Created by David Guido, Pierce Findlay & Kayla Nguyen on 11/01/2019.
    
    import SwiftUI
    
    struct ContentView: View {
        init() {
            UITabBar.appearance().backgroundColor = UIColor.white
        }
        
        var body: some View {
            return AuthenticationHandler()
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
