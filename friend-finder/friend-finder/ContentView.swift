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
            return AuthenticationHandlerView()
        }
    }
    
    
    struct NavBarStateView: View {
        @State private var selected = 0
        
        var body: some View {
            return TabView(selection: $selected) {
                // Tab 00
                DiscoverView().tabItem({
                    Image(systemName: Constants.TabBarImageName.tabBar0)
                        .font(.title)
                    Text("\(Constants.TabBarText.tabBar0)")
                }).tag(0)
                
                // Tab 01
                NewPickupEventView().tabItem({
                    Image(systemName: Constants.TabBarImageName.tabBar1)
                        .font(.title)
                    Text("\(Constants.TabBarText.tabBar1)")
                    }).tag(1).zIndex(10)
                
                // Tab 02
                SearchView().tabItem({
                    Image(systemName: Constants.TabBarImageName.tabBar2)
                        .font(.title)
                    Text("\(Constants.TabBarText.tabBar2)")
                }).tag(2)
                
                // Tab 03
                ProfileView().tabItem({
                    Image(systemName: Constants.TabBarImageName.tabBar3)
                        .font(.title)
                    Text("\(Constants.TabBarText.tabBar3)")
                }).tag(3)
            }.accentColor(Color.blue)
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
