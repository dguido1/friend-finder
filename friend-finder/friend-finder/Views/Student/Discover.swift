    //
    //  DiscoverView.swift
    //
    //  Friend Finder, CPSC 362, M/W: 11:00am-12:50pm
    //  CSUF Fall 2019
    //
    //  Created by David Guido, Pierce Findlay & Kayla Nguyen on 11/01/2019.
    
    import SwiftUI
    
    struct Discover: View
    {
        @State var animation = true
        @ObservedObject var session = FirebaseSession()
        
        static let color00 = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
        static let color01 = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)

        static let color02 = Color(red: 139.0 / 255, green: 72.0 / 255, blue: 120.0 / 255)
        static let color03 = Color(red: 139.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)

        static let color04 = Color(red: 259.0 / 255, green: 22.0 / 255, blue: 120.0 / 255)
        static let color05 = Color(red: 259.0 / 255, green: 132.0 / 255, blue: 20.0 / 255)
        
        
        // Date function, returns current date
        static let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter
        }()
        
        var now = Date()
        
        var body: some View {
            
            return  VStack {
                
                HStack {                        // Title container
                    VStack (alignment: .leading) {
                        
                        // Date text ('Sat' hard-coded + call to current date function)
                        Text ("Saturday, \(now, formatter: Self.dateFormatter)").font(.subheadline).bold().multilineTextAlignment(.leading).foregroundColor(Color.gray)
                        Text ("Discover").font(.largeTitle).fontWeight(.bold).bold().foregroundColor(Color.black)
                        
                        // Line divider
                        Divider().padding(.vertical, -15)
                        
                    }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 75, alignment: Alignment.top)
                    
                    // Settings button
                    Button(action:
                        {
                            // Add an action here
                    }, label:
                        {
                            Image(systemName: "gear").font(.title).foregroundColor(.gray)
                    })
                    
                    // Navbar container formatting
                }.frame(minWidth: 0, maxWidth: .infinity, alignment: Alignment.top).padding(.horizontal, 30).padding(.bottom, 40)
                
                // Events ScrollView
                ScrollView (.horizontal, showsIndicators: false) {
                    // Secondary parent view (Makes left align & padding look correct)
                    HStack {
                        // EventCards horizontal stack
                        HStack {
                            Spacer()
                            EventItemCard(cardImage: "shpacsuf", index: 0)
                            EventItemCard(cardImage: "heatcsuf", index: 1)
                            EventItemCard(cardImage: "aiccsuf", index: 2)
                        }
                        // EventCards horizontal stack formatting
                    }.padding(.leading, 40)
                    // ScrollView formatting
                }.padding(.vertical, 0)
                
                
                // Notifications parent container
                VStack {
                    // Notifications title container
                    HStack {
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
                    VStack {
                        // Four hard-coded 'Notification Items'
                        NotificationItem(icon: "envelope", message: "New message from Anthony Rodriguez")
                        NotificationItem(icon: "gear", message: "New theme available: Dark Theme")
                        NotificationItem(icon: "person.crop.circle.badge.plus", message: "3 New subscribers")
                        NotificationItem(icon: "person.3", message: "New club activity: SHPA Blood Drive")
                        
                        // Notifications vertical stack formatting
                    }.padding(.horizontal, 25)
                    
                    // Notifications parent container formatting
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 200, alignment: Alignment.center).aspectRatio(contentMode: .fit)
                
                // End VStack (Body --> Main Container)
            }.onAppear(perform: getPUEvents)
        }
        
        //MARK: Functions
        func getPUEvents() {
            session.getPickUpEvents()
        }
        
        
        // EventItemCard parent container
        func GetEventTypeLabel(pickUpEvent: PickUpEvent) -> some View {
            
            if pickUpEvent.isStudyGroup == "true" {
                return Text("Study Group")
            }
            else {
                return Text("Study Group")
            }
        }
        
        /*
         Custom Event Card View
         */
        func EventItemCard(cardImage : String, index: Int) -> some View {
            
            var currentColor00: Color
            var currentColor01: Color
            
            if (index == 0)
            {
                currentColor00 = Self.color00
                currentColor01 = Self.color01
            }
            else if (index == 1)
            {
                currentColor00 = Self.color02
                currentColor01 = Self.color03
            }
            else
            {
                currentColor00 = Self.color04
                currentColor01 = Self.color05
            }
            
            return  VStack {
                // ScrollView element texts
                VStack(alignment: .leading) {
                    if (session.pickUpItems.count > 0)
                    {
                        Text(session.pickUpItems[index].date).font(.callout).fontWeight(.heavy).foregroundColor(Color.blue)
                        Text("Study Group").font(.callout).foregroundColor(Color.black)
                        Text(session.pickUpItems[index].name).font(.title).foregroundColor(Color.black)
                    }
                    else
                    {
                        Text("Empty Table or events couldnt be populated").font(.title).foregroundColor(Color.black)
                    }
                    
                    // ScrollView element texts formatting
                }.padding(.top, 20).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                // ScrollView button (image, mask, shadow)
                HStack {
                    Button (action:{
                    }){
                        ZStack {
                            VStack {
                                if (session.pickUpItems.count > 0) {

                                        Text ("Type: Study Group").foregroundColor(Color.black).zIndex(5)
                                        Text ("Subject: " + session.pickUpItems[index].subject).foregroundColor(Color.black).zIndex(5)
                                        Text ("Course: " + session.pickUpItems[index].course).foregroundColor(Color.black).zIndex(5)

                                }
                            }.zIndex(5).padding(10).cornerRadius(10).background(Color.white).frame(minWidth: 250, maxWidth: 250, minHeight: 80, maxHeight: 80)
                            Rectangle()
                            .fill(LinearGradient(
                              gradient: .init(colors: [currentColor00, currentColor01]),
                              startPoint: .init(x: 0.5, y: 0),
                              endPoint: .init(x: 0.5, y: 0.6)
                            )).cornerRadius(25).zIndex(0)
                            .frame(width: 300, height: 200)
                            
                        }
                    }.buttonStyle(PlainButtonStyle())
                    
                    // Right arrow image
                    Image(systemName: "arrow.right").font(.headline).foregroundColor(.gray).frame(minHeight: 0, maxHeight: .infinity)
                }
                
                // EventItemCard parent container formatting
            }.frame(minHeight: 0, maxHeight: 276)
        }
        
    }
    
    
    /*
     Custom Notification View
     */
    struct NotificationItem : View {
        var icon : String
        var message : String
        
        var body : some View {
            // Notification parent container
            return  HStack {
                Image(systemName: icon).font(.subheadline).frame(minWidth: 30, maxWidth: 30, minHeight: 30, maxHeight: 30)
                
                Text(message).font(.subheadline)
                
                // Notification parent container formatting
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 20, alignment: Alignment.leading)
        }
    }
    
    struct Discover_Previews: PreviewProvider {
        static var previews: some View {
            Discover()
        }
    }
