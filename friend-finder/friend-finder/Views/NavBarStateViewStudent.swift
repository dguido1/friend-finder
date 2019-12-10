    //
    //  NavBarStateView.swift
    //  friend-finder
    //
    //  Created by David Guido on 12/7/19.
    //  Copyright © 2019 CSUF. All rights reserved.
    //

    import SwiftUI


    struct NavBarStateViewStudent: View {
        @State private var selected = 0
        
        var body: some View {
            return TabView(selection: $selected) {
                // Tab 00
                Discover().tabItem({
                    Image(systemName: Constants.TabBarImageNameStudent.tabBar0)
                        .font(.title)
                    Text("\(Constants.TabBarTextStudent.tabBar0)")
                }).tag(0)
                
                // Tab 01
                CreateStudent().tabItem({
                    Image(systemName: Constants.TabBarImageNameStudent.tabBar1)
                        .font(.title)
                    Text("\(Constants.TabBarTextStudent.tabBar1)")
                    }).tag(1)
                    
                // Tab 02
                Search().tabItem({
                    Image(systemName: Constants.TabBarImageNameStudent.tabBar2)
                        .font(.title)
                    Text("\(Constants.TabBarTextStudent.tabBar2)")
                }).tag(2)
                
                // Tab 03
                ProfileStudent().tabItem({
                    Image(systemName: Constants.TabBarImageNameStudent.tabBar3)
                        .font(.title)
                    Text("\(Constants.TabBarTextStudent.tabBar3)")
                }).tag(3)
            }.accentColor(Color.blue)
        }
    }

    struct NavBarStateViewStudent_Previews: PreviewProvider {
        static var previews: some View {
            NavBarStateViewStudent()
        }
    }
