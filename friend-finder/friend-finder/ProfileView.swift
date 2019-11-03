//
//  ProfileView.swift
//
//  Friend Finder, CPSC 362, M/W: 11:00am-12:50pm
//  CSUF Fall 2019
//
//  Created by David Guido, Pierce Findlay & Kayla Nguyen on 11/01/2019.

import SwiftUI

struct ProfileView: View
{
    var body: some View
    {
        // Parent container (Full view)
        VStack
        {
            // Navbar container (Top title / settings)
            HStack
            {
                // Title container
                VStack (alignment: .leading)
                {
                            
                    Text ("Discover").font(.largeTitle).fontWeight(.bold).bold().foregroundColor(Color.black)
                            
                    // Line divider
                    Divider().padding(.vertical, -15)
                            
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 75, alignment: Alignment.top).padding(.top, 25)
                        
                // Settings button
                Button(action:
                {
                    // Add an action here
                }, label:
                {
                    Image(systemName: "gear").font(.title).foregroundColor(.gray)
                })
                 
            // Navbar container formatting
            }.frame(minWidth: 0, maxWidth: .infinity, alignment: Alignment.top).padding(.horizontal, 30)
                
            // Events ScrollView
            ScrollView (.horizontal, showsIndicators: false)
            {
                // Secondary parent view (Makes left align & padding look correct)
                HStack
                {
                    // EventCards horizontal stack
                    HStack
                    {
                        EventCard(image: "shpacsuf", text1: "TODAY", text2: "SHPA Blood Drive", text3: "Student Health Professions Association")
                        EventCard(image: "heatcsuf", text1: "SUNDAY", text2: "Sunday Service", text3: "Heat Campus Ministry")
                        EventCard(image: "aiccsuf", text1: "MONDAY", text2: "Council Meeting", text3: "Arts Inter-Club Council")
                        
                    // EventCards horizontal stack formatting
                    }.padding(.leading, 40)
                }
                    
            // ScrollView formatting
            }.padding(.vertical, 25)
                
            // Notifications parent container
            VStack
            {
                // Notifications title container
                HStack
                {
                    Text("Notifications").font(.title).bold().foregroundColor(Color.black).padding(.horizontal, 15)
                            
                    Button("Clear")
                    {
                        // Button was tapped
                    }.padding(.horizontal, 10)
                            
                    Button("See All")
                    {
                        // Button was tapped
                    }.padding(.horizontal, 10)
                    
                // Notifications title container formatting
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 20, alignment: Alignment.leading).padding(.horizontal, 10)
                    
                // Notifications vertical stack
                VStack
                {
                    // Four hard-coded 'Notification Items'
                    NotificationItem(image: "envelope", text1: "New message from Anthony Rodriguez")
                    NotificationItem(image: "gear", text1: "New theme available: Dark Theme")
                    NotificationItem(image: "person.crop.circle.badge.plus", text1: "3 New subscribers")
                    NotificationItem(image: "person.3", text1: "New club activity: SHPA Blood Drive")
                          
                // Notifications vertical stack formatting
                }.padding(.horizontal, 25)
                
            // Notifications parent container formatting
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 200, alignment: Alignment.center).aspectRatio(contentMode: .fit).padding(.vertical, 20)
               
        // Parent container formatting
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
/*
 

struct ProfileItem : View {
    
    var image : String
    var text1 : String
    var text2 : String
    
    var body : some View {
        return
            VStack {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                VStack(alignment: .leading) {
                    Text(text1)
                        .font(.title)
                    //                    .lineLimit(2)
                    Text(text2)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
        }
    }
}
 */
