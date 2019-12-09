    //
    //  NavBarStateView.swift
    //  friend-finder
    //
    //  Created by David Guido on 12/7/19.
    //  Copyright © 2019 CSUF. All rights reserved.
    //

    import SwiftUI


    struct NavBarStateView: View {
        @State public var selected: Double = 0.0
        
        var body: some View {
            return TabView(selection: $selected) {
                // Tab 00
                DiscoverView().tabItem({
                    Image(systemName: Constants.TabBarImageName.tabBar0)
                        .font(.title)
                    Text("\(Constants.TabBarText.tabBar0)")
                }).tag(0)
                
                // Tab 01
                CreateView().tabItem({
                    Image(systemName: Constants.TabBarImageName.tabBar1)
                        .font(.title)
                    Text("\(Constants.TabBarText.tabBar1)")
                }).tag(1)
                
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

    struct NavBarStateView_Previews: PreviewProvider {
        static var previews: some View {
            NavBarStateView()
        }
    }
