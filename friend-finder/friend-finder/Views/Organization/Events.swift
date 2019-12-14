//
//  DiscoverView.swift
//
//  Friend Finder, CPSC 362, M/W: 11:00am-12:50pm
//  CSUF Fall 2019
//
//  Created by David Guido, Pierce Findlay & Kayla Nguyen on 11/01/2019.

import SwiftUI

struct Events: View
{
    @State var animation = true
    @ObservedObject var session = FirebaseSession()
    
    // Date function, returns current date
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    var now = Date()
    
    var body: some View {
        
        return  VStack {
            
            HStack {                                    // Title container
                VStack (alignment: .leading) {
                    
                    // Date text ('Sat' hard-coded + call to current date function)
                    Text ("Saturday, \(now, formatter: Self.dateFormatter)").font(.subheadline).bold().multilineTextAlignment(.leading).foregroundColor(Color.gray)
                    Text ("Upcoming Events").font(.largeTitle).fontWeight(.bold).bold().foregroundColor(Color.black)
                    
                    // Line divider
                    Divider().padding(.vertical, -15)
                    
                }.padding(.top, 25).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 75, alignment: Alignment.top)
                
                // Settings button
                Button(action:
                    {
                        // Add an action here
                }, label:
                    {
                        Image(systemName: "gear").font(.title).foregroundColor(.gray)
                })
                
                // Navbar container formatting
            }.frame(minWidth: 0, maxWidth: .infinity).padding(.horizontal, 30)
            
            
            
            VStack {
                GetOrgEvents().padding(.top, 25)            }
            
            // End VStack (Body --> Main Container)
        }.onAppear(perform: getOrganizationEvents).frame(maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: Alignment.top)
    }
    
    func GetOrgEvents() -> some View {
        return Text("No upcoming events.")
    }
    
    //MARK: Functions
    func getOrganizationEvents() {
        session.getOrganizationEvents()
    }
}

struct Events_Previews: PreviewProvider {
    static var previews: some View {
        Discover()
    }
}
