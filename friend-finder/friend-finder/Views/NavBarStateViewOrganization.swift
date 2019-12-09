//
//  NavBarStateViewOrganization.swift
//  friend-finder
//
//  Created by David Guido on 12/9/19.
//  Copyright © 2019 CSUF. All rights reserved.
//

import SwiftUI

struct NavBarStateViewOrganization: View {
    
        @State private var selected = 0
        
        var body: some View {
            return TabView(selection: $selected) {
                // Tab 00
                Events().tabItem({
                    Image(systemName: Constants.TabBarImageNameOrganization.tabBar0)
                        .font(.title)
                    Text("\(Constants.TabBarTextOrganization.tabBar0)")
                }).tag(0)
                
                // Tab 01
                CreateOrganization().tabItem({
                    Image(systemName: Constants.TabBarImageNameOrganization.tabBar1)
                        .font(.title)
                    Text("\(Constants.TabBarTextOrganization.tabBar1)")
                    }).tag(1)
                    
                // Tab 03
                ProfileOrganization().tabItem({
                    Image(systemName: Constants.TabBarImageNameOrganization.tabBar2)
                        .font(.title)
                    Text("\(Constants.TabBarTextOrganization.tabBar2)")
                }).tag(2)
            }.accentColor(Color.blue)
        }
    }
struct NavBarStateViewOrganization_Previews: PreviewProvider {
    static var previews: some View {
        NavBarStateViewOrganization()
    }
}
