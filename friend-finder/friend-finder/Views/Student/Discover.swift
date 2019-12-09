    //
    //  DiscoverView.swift
    //
    //  Friend Finder, CPSC 362, M/W: 11:00am-12:50pm
    //  CSUF Fall 2019
    //
    //  Created by David Guido, Pierce Findlay & Kayla Nguyen on 11/01/2019.
    
    import SwiftUI
    
    struct Discover: View {
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
            
            Spacer()
            /*
             
             
             // Parent container (Full view)
             VStack {
             // Navbar container (Top title / settings)
             HStack {
             // Title container
             VStack (alignment: .leading) {
             // Date text ('Sat' hard-coded + call to current date function)
             Text ("Saturday, \(now, formatter: Self.dateFormatter)").font(.subheadline).bold().multilineTextAlignment(.leading).foregroundColor(Color.gray)
             
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
             ScrollView (.horizontal, showsIndicators: false) {
             // Secondary parent view (Makes left align & padding look correct)
             HStack {
             // EventCards horizontal stack
             HStack {
             EventItemCard(cardImage: "shpacsuf", index: 0)
             EventItemCard(cardImage: "heatcsuf", index: 1)
             EventItemCard(cardImage: "aiccsuf", index: 2)
             
             // EventCards horizontal stack formatting
             }.padding(.leading, 40)
             }
             
             // ScrollView formatting
             }.padding(.vertical, 25)
             
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
             }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 200, alignment: Alignment.center).aspectRatio(contentMode: .fit).padding(.vertical, 20)
             
             // Parent container formatting
             }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
             
             */
        }
    
        
        /*
         Custom Event Card View
         */
       // func EventItemCard() -> some View {
            /*
             
            var cardImage : String
            var index: Int = 0
            let pickUpEvent : PickUpEvent
            
            session.getPickUpEvents()
             

             
             
             switch (index)
             {
             case 0:
             return  VStack {
             // ScrollView element texts
             VStack(alignment: .leading) {
             Text(pickUpEvent.date).font(.callout).fontWeight(.heavy).foregroundColor(Color.blue)
             GetEventTypeLabel(pickUpEvent)
             Text(pickUpEvent.name).font(.title).foregroundColor(Color.black)
             
             // ScrollView element texts formatting
             }.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
             
             // ScrollView button (image, mask, shadow)
             HStack {
             Button (action:{
             }){
             Image(cardImage)
             .resizable()
             .aspectRatio(contentMode: .fit)
             .frame(minWidth: 0, maxWidth: .infinity)
             .cornerRadius(10)
             .shadow(radius: 10)
             }.buttonStyle(PlainButtonStyle())
             
             // Right arrow image
             Image(systemName: "arrow.right").font(.headline).foregroundColor(.gray).frame(minHeight: 0, maxHeight: .infinity)
             }
             
             // EventItemCard parent container formatting
             }.frame(minHeight: 0, maxHeight: 276)
             case 1:
             return  VStack {
             // ScrollView element texts
             VStack(alignment: .leading) {
             Text(pickUpEvent.date).font(.callout).fontWeight(.heavy).foregroundColor(Color.blue)
             GetEventTypeLabel(pickUpEvent)
             Text(pickUpEvent.name).font(.title).foregroundColor(Color.black)
             
             // ScrollView element texts formatting
             }.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
             
             // ScrollView button (image, mask, shadow)
             HStack {
             Button (action:{
             }){
             Image(cardImage)
             .resizable()
             .aspectRatio(contentMode: .fit)
             .frame(minWidth: 0, maxWidth: .infinity)
             .cornerRadius(10)
             .shadow(radius: 10)
             }.buttonStyle(PlainButtonStyle())
             
             // Right arrow image
             Image(systemName: "arrow.right").font(.headline).foregroundColor(.gray).frame(minHeight: 0, maxHeight: .infinity)
             }
             
             // EventItemCard parent container formatting
             }.frame(minHeight: 0, maxHeight: 276)
             case 2:
             return  VStack {
             // ScrollView element texts
             VStack(alignment: .leading) {
             Text(pickUpEvent.date).font(.callout).fontWeight(.heavy).foregroundColor(Color.blue)
             GetEventTypeLabel(pickUpEvent)
             Text(pickUpEvent.name).font(.title).foregroundColor(Color.black)
             
             // ScrollView element texts formatting
             }.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
             
             // ScrollView button (image, mask, shadow)
             HStack {
             Button (action:{
             }){
             Image(cardImage)
             .resizable()
             .aspectRatio(contentMode: .fit)
             .frame(minWidth: 0, maxWidth: .infinity)
             .cornerRadius(10)
             .shadow(radius: 10)
             }.buttonStyle(PlainButtonStyle())
             
             // Right arrow image
             Image(systemName: "arrow.right").font(.headline).foregroundColor(.gray).frame(minHeight: 0, maxHeight: .infinity)
             }
             
             // EventItemCard parent container formatting
             }.frame(minHeight: 0, maxHeight: 276)
             default:
             return  VStack {
             // ScrollView element texts
             VStack(alignment: .leading) {
             Text(pickUpEvent.date).font(.callout).fontWeight(.heavy).foregroundColor(Color.blue)
             GetEventTypeLabel(pickUpEvent)
             Text(pickUpEvent.name).font(.title).foregroundColor(Color.black)
             
             // ScrollView element texts formatting
             }.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
             
             // ScrollView button (image, mask, shadow)
             HStack {
             Button (action:{
             }){
             Image(cardImage)
             .resizable()
             .aspectRatio(contentMode: .fit)
             .frame(minWidth: 0, maxWidth: .infinity)
             .cornerRadius(10)
             .shadow(radius: 10)
             }.buttonStyle(PlainButtonStyle())
             
             // Right arrow image
             Image(systemName: "arrow.right").font(.headline).foregroundColor(.gray).frame(minHeight: 0, maxHeight: .infinity)
             }
             
             */
         //   return AnyView(Spacer())
            
            // EventItemCard parent container formatting
        }
        
        
        // EventItemCard parent container
        
        
        /*
     
 
        func GetEventTypeLabel() -> some View {
            let pickUpEvent: PickUpEvent
            
            if pickUpEvent.isStudyGroup
            {
                return AnyView(Text("Study Group"))
            }
            else
            {
                return AnyView(Text("Meeting Location"))
            }
        }
    }*/
    
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
