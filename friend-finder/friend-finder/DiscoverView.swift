//
//  AppsView.swift
//
//  Friend Finder, CPSC 362, M/W: 11:00am-12:50pm
//  CSUF Fall 2019
//
//  Created by David Guido, Pierce Findlay & Kayla Nguyen on 11/01/2019.

import SwiftUI

struct DiscoverView: View
{
    // Date function, returns current date.
    @State var animation = true
    static let dateFormatter: DateFormatter =
    {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    var now = Date()
    
    let names = ["John", "Apple", "Seed"]
    
    var body: some View
    {
        // Parent container (Full view)
        VStack
        {
                // Navbar container (Top title / settings)
                HStack
                {       // Title container
                        VStack (alignment: .leading)
                        {
                            // Text with call to current date function above body
                            Text ("Saturday, \(now, formatter: Self.dateFormatter)").font(.subheadline).bold().multilineTextAlignment(.leading).foregroundColor(Color.gray)
                            
                            Text ("Discover").font(.largeTitle).fontWeight(.bold).bold().foregroundColor(Color.black)
                            
                            Divider().padding(.vertical, -15) // Line divider
                            
                        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 75, alignment: Alignment.top).padding(.top, 25)
                        
                        // Settings button
                        Button(action:
                        {
                            // Add action
                        }, label:
                            {
                            Image(systemName: "gear").font(.title).foregroundColor(.gray)
                        })
                        
                }.frame(minWidth: 0, maxWidth: .infinity, alignment: Alignment.top).padding(.horizontal, 30)
                
                // Events ScrollView
                ScrollView (.horizontal, showsIndicators: false)
                {
                    HStack
                    {
                        HStack
                        {
                            EventCard(image: "shpacsuf", text1: "TODAY", text2: "SHPA Blood Drive", text3: "Student Health Professions Association")
                            EventCard(image: "heatcsuf", text1: "SUNDAY", text2: "Sunday Service", text3: "Heat Campus Ministry")
                            EventCard(image: "aiccsuf", text1: "MONDAY", text2: "Council Meeting", text3: "Arts Inter-Club Council")
                        
                        }.padding(.leading, 40)
                    }
                
                }.padding(.vertical, 25)
                
                // Notifications container
                VStack
                {
                    // Notifications title container
                    HStack
                    {
                        Text("Notifications").font(.title).bold().foregroundColor(Color.black).padding(.horizontal, 15)
                            
                            Button("Clear") {
                                // Button was tapped
                            }.padding(.horizontal, 10)
                            
                            Button("See All") {
                                // Button was tapped
                            }.padding(.horizontal, 10)
                    
                    }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 20, alignment: Alignment.leading).padding(.horizontal, 10)
                    
                    VStack
                    {
                        // Four example: 'Notification Items'
                        NotificationItem(image: "envelope", text1: "New message from Anthony Rodriguez")
                        NotificationItem(image: "gear", text1: "New theme available: Dark Theme")
                        NotificationItem(image: "person.crop.circle.badge.plus", text1: "3 New subscribers")
                        NotificationItem(image: "person.3", text1: "New club activity: SHPA Blood Drive")
                            
                    }.padding(.horizontal, 25)
                
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 200, alignment: Alignment.center).aspectRatio(contentMode: .fit).padding(.vertical, 20)
                
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
    }
}

/*
    Custom Event Card View
*/
struct EventCard : View
{
    var image : String  // Organization image
    var text1 : String  // Day of the week
    var text2 : String  // Event name
    var text3 : String  // Organization name
    
    var body : some View
    {
        return  VStack
                {
                    VStack(alignment: .leading)
                    {
                        Text(text1).font(.callout).fontWeight(.heavy).foregroundColor(Color.blue)
                        Text(text2).font(.title)
                        Text(text3).font(.subheadline).fontWeight(.medium).foregroundColor(.gray)
                    }.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    HStack
                    {
                        Image(image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                        
                        Image(systemName: "arrow.right").font(.headline).foregroundColor(.gray).frame(minHeight: 0, maxHeight: .infinity)
                    }
                
                }.frame(minHeight: 0, maxHeight: 276)
    }
}

/*
    Custom Notification View
*/
struct NotificationItem : View
{
    var image : String  // Notification icon
    var text1 : String  // Notification message
    
    var body : some View
    {
        return  HStack
                {
                    Image(systemName: image).font(.subheadline).frame(minWidth: 30, maxWidth: 30, minHeight: 30, maxHeight: 30)
                    
                    Text(text1).font(.subheadline)
                    
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 20, alignment: Alignment.leading)
    }
}

struct DiscoverView_Previews: PreviewProvider
{
    static var previews: some View
    {
        DiscoverView()
    }
}




// NavView / List Example
/*
 

NavigationView
{
    List {
        Text("Test01")
        Text("Test01")
        Text("Test01")
        Text("Test01")
        Text("Test01")
        Text("Test01")
    }
    .navigationBarItems(leading:
        
        // Date text: Call to current date function above body
        Text ("Saturday, \(now, formatter: Self.dateFormatter)").font(.subheadline).bold().multilineTextAlignment(.center).foregroundColor(Color.gray),trailing:
        
        // Settings button
        Button(action: {
            // Add action
        }, label: {
            Image(systemName: "gear").font(.title).foregroundColor(.gray)
            
        })
    )
        .navigationBarTitle(Text("Discover"))
}
 */



// Animation Example
 
 //Image("image1")
      //   .resizable()
      //   .aspectRatio(contentMode: .fit)
      //   .cornerRadius(10)
      //   .shadow(color: Color.gray, radius: 10)
      //   .scaleEffect(animation ? 0.5 : 1)
      ///   .rotation3DEffect(Angle(degrees: animation ? 0 : 360), axis: (x: 0, y: 360, z: 0))
       //  .animation(Animation.easeInOut(duration: /3).repeatForever())
      //   .onAppear{ self.animation.toggle() }
 
 //}.padding(.horizontal, 20)
