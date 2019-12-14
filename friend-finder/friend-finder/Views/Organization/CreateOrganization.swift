//
//  NewPickupEventView.swift
//  friend-finder
//
//  Created by David Guido on 12/4/19.
//  Copyright © 2019 CSUF. All rights reserved.
//

import SwiftUI

struct CreateOrganization: View {
    
    // Event vars
    @State var eventName: String = ""
    @State var eventDescription: String = ""
    @State var eventLocation: String = "Location"
    @State var eventLocationPool = ["Library", "TitanStudentUnion", "CS Building", "Engineering Building","EC Building", "McCarthy Hall", "Student Housing", "Humanities Building","University Hall", "Langsdorf Hall"]
    @State var selectedLocation = 4
    @State var eventDate: Date = Date()
    
    // Event helper vars
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
    @State private var selectedDate = Date()   // Date picker selection
    @State var currentDate = Date()   // Current date/time
    
    // Create student handler vars
    @State var showLocationPicker: Bool = false
    @State var showDatePicker: Bool = false
    @State var showCreatedEventPage: Bool = false
    
    // Firebase database
    @ObservedObject var session = FirebaseSession()
    @Environment(\.presentationMode) var presentationMode
    
    // Date function, returns current date
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    var now = Date()
    
    var body: some View {
        
        CreateOrganizationHandler()
    }
    
    // Function that returns correct view based on current state
    func CreateOrganizationHandler() -> some View {
        
        // Neither picker has been selected
        if (!showLocationPicker && !showDatePicker &&
            !showCreatedEventPage) {   // Show default view
            
            return AnyView(DefaultView())
        }
        else if (showLocationPicker) {   // Show location picker
            
            return AnyView(CustomFSLocationInputView().frame(alignment: .topLeading))
        }
        else if (showDatePicker){   // Show date picker
            
            return AnyView(CustomFSDateInputView().frame(alignment: .topLeading))
        }
        else {
            return
                AnyView(CustomFSCreatedEventView().frame(alignment: .topLeading))
        }
    }
    
    func DefaultView() -> some View {
        
        return VStack {
            HStack {                        // Title container
                VStack (alignment: .leading) {
                    
                    // Date text ('Sat' hard-coded + call to current date function)
                    Text ("Saturday, \(now, formatter: Self.dateFormatter)").font(.subheadline).bold().multilineTextAlignment(.leading).foregroundColor(Color.gray)
                    Text ("Create").font(.largeTitle).fontWeight(.bold).bold().foregroundColor(Color.black)
                    
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
            }.frame(minWidth: 0, maxWidth: .infinity, alignment: Alignment.top).padding(.horizontal, 30)
            CustomNameInputView()
            Divider().padding(.bottom, 5).padding(.top, -5)
            CustomDescriptionInputView()
            Divider().padding(.bottom, 5).padding(.top, -5)
            
            VStack {
                Button(action: {
                    self.showLocationPicker = true
                }) {
                    Text("Choose a Location: \(eventLocationPool[selectedLocation])").opacity(0.75).padding(.bottom, -5).padding(.leading, 10).foregroundColor(Color.black).frame(alignment: .leading).multilineTextAlignment(.leading).frame(minWidth: 275, maxWidth: 275, alignment: .bottomLeading).foregroundColor(Color.black)
                }.padding(.bottom, 3)
                
                
                Divider().padding(.bottom, 3)
                
                Button(action: {
                    self.showDatePicker = true
                }) {
                    Text("Select Date & Time: \(selectedDate)").opacity(0.75).padding(.bottom, -5).padding(.leading, 10).foregroundColor(Color.black).frame(alignment: .leading).multilineTextAlignment(.leading).frame(minWidth: 275, maxWidth: 275, alignment: .bottomLeading).foregroundColor(Color.black)
                }.padding(.bottom, 19)
                
                Divider().padding(.bottom, 19)
                
                Button(action: {
                    self.showCreatedEventPage = true
                    self.CustomCreateEventButton()
                    self.addOrganizationEvent()
                }) {
                    Text("Create Event")
                }.padding(.bottom, 19)
                
            }.frame(minWidth: 275, maxWidth: 275, alignment: .bottomLeading).foregroundColor(Color.black)
        }
        
    }
    
    // Location Picker input view (Fullscreen)
    func CustomFSLocationInputView() -> some View {
        
        return VStack{
            // Back button
            Button(action:
                {
                    self.showLocationPicker = false
            }) {
                Text("Back to Create").font(.subheadline).fontWeight(.medium).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            }.padding(.bottom, 10)
            
            Text("Location: \(eventLocationPool[selectedLocation])").padding(.bottom, -5).padding(.leading, 10).foregroundColor(Color.black).frame(alignment: .leading).multilineTextAlignment(.leading).frame(minWidth: 275, maxWidth: 275, alignment: .bottomLeading).foregroundColor(Color.black)
            
            Picker(selection: $selectedLocation, label: Text("Please choose a location")) {
                ForEach(0 ..< eventLocationPool.count) {
                    Text(self.eventLocationPool[$0])
                }
                
            }.labelsHidden().frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            
        }
        
    }
    
    func CustomFSDateInputView() -> some View {
        
        var endComponents = DateComponents()
        endComponents.month = 12
        endComponents.year = 2019
        endComponents.day = 31
        endComponents.minute = 59
        endComponents.hour = 23
        
        let endDate = Calendar.current.date(from: endComponents) ?? Date()
        let range = Date() ... endDate
        
        return VStack {
            // Back button
            Button(action:
                {
                    self.showDatePicker = false
            }) {
                Text("Back to Create").font(.subheadline).fontWeight(.medium).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            }.padding(.bottom, 10)
            
            Text("Date & Time: \(selectedDate)").padding(.bottom, -5).padding(.leading, 10).foregroundColor(Color.black).frame(alignment: .leading).multilineTextAlignment(.leading).frame(minWidth: 275, maxWidth: 275, alignment: .bottomLeading).foregroundColor(Color.black).padding(.bottom, 100)
            
            Text("Pick a Date & Time:").frame(minWidth: 250, maxWidth: 250, alignment: .leading).font(.headline).padding(.bottom, 10)
            
            Text("(Restrictions: December, 6am-12am)").opacity(0.75).frame(minWidth: 250, maxWidth: 250).font(.caption)
            
            DatePicker("Event Date", selection: $selectedDate, in: range).labelsHidden()
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
    
    // Created Event input view (Fullscreen)
    func CustomFSCreatedEventView() -> some View {
        return VStack{
            
            Text("Event Created!").padding(.bottom, 10).font(.largeTitle).foregroundColor(Color.blue).frame(alignment: .center).multilineTextAlignment(.center).frame(minWidth: 275, maxWidth: 275, alignment: .bottomLeading).foregroundColor(Color.black)
            
            Text("Consider sending out post notifications to keep subscribers updated").padding(.bottom, 10).padding(.leading, 10).foregroundColor(Color.black).frame(alignment: .center).multilineTextAlignment(.center).frame(minWidth: 275, maxWidth: 275, alignment: .bottomLeading).foregroundColor(Color.black)
            
            // Back button
            Button(action:
                {
                    self.showCreatedEventPage = false
            }) {
                Text("Ok").font(.subheadline).fontWeight(.medium).frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            }.padding(.bottom, 100)
        }
        
    }
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
    
    // Adds event to database
    func addOrganizationEvent() {
        if !eventName.isEmpty {
            
            //Add PU Event to Firebase
            let dateFormatter = DateFormatter()
            dateFormatter.timeStyle = .none
            dateFormatter.dateStyle = .medium
            
            let timeFormatter = DateFormatter()
            timeFormatter.timeStyle = .medium
            timeFormatter.dateStyle = .none
            
            let eDate = dateFormatter.string(from: selectedDate)
            let eTime = timeFormatter.string(from: selectedDate)
            
            let eLocation = String(selectedLocation)
            
            session.uploadOrganizationEvent(eventName: self.eventName, eventDescription: self.eventDescription, eventLocation: eLocation, eventTime: eTime, eventDate: eDate)
            
        }
    }
    
    // Name TextField input view
    func CustomNameInputView() -> some View
    {
        if (eventName.count > 0) {
            return VStack {
                Text("Name the Event:").frame(minWidth: 285, maxWidth: 285, alignment: .bottomLeading).font(.headline)
                
                ZStack {
                    VStack {
                        Text("").opacity(0.75).padding(.top, 6).padding(.leading, 10).frame(alignment: .leading).frame(alignment: .leading).multilineTextAlignment(.leading)
                    }.frame(minWidth: 275, maxWidth: 275, alignment: .bottomLeading).foregroundColor(Color.black)
                    
                    TextField(eventName, text:$eventName).padding(.bottom, -5).padding(.leading, 10).foregroundColor(Color.black).frame(alignment: .leading).multilineTextAlignment(.leading).frame(minWidth: 275, maxWidth: 275, alignment: .bottomLeading).foregroundColor(Color.black)
                }
            }.frame(alignment: .leading)
        }
        
        return VStack {
            Text("Name the Event:").frame(minWidth: 285, maxWidth: 285, alignment: .bottomLeading).font(.headline)
            
            ZStack {
                VStack {
                    Text("Name").opacity(0.75).padding(.top, 0).padding(.leading, 10).frame(alignment: .leading).frame(alignment: .leading).multilineTextAlignment(.leading)
                }.frame(minWidth: 275, maxWidth: 275, alignment: .bottomLeading).foregroundColor(Color.black)
                
                TextField(eventName, text:$eventName).padding(.bottom, -5).padding(.leading, 10).foregroundColor(Color.black).frame(alignment: .leading).multilineTextAlignment(.leading).frame(minWidth: 275, maxWidth: 275, alignment: .bottomLeading).foregroundColor(Color.black)
            }
        }.frame(alignment: .leading)
    }
    
    // Desc TextField input view
    func CustomDescriptionInputView() -> some View
    {
        if (eventDescription.count > 0) {
            return VStack {
                Text("Give the Event a Descripton:").frame(minWidth: 285, maxWidth: 285, alignment: .bottomLeading).font(.headline)
                
                ZStack {
                    VStack {
                        Text("").opacity(0.75).padding(.top, 6).padding(.leading, 10).frame(alignment: .leading).frame(alignment: .leading).multilineTextAlignment(.leading)
                    }.frame(minWidth: 275, maxWidth: 275, alignment: .bottomLeading).foregroundColor(Color.black)
                    
                    TextField(eventDescription, text:$eventDescription).padding(.bottom, -5).padding(.leading, 10).foregroundColor(Color.black).frame(alignment: .leading).multilineTextAlignment(.leading).frame(minWidth: 275, maxWidth: 275, alignment: .bottomLeading).foregroundColor(Color.black)
                }
            }.frame(alignment: .leading)
        }
        
        return VStack {
            Text("Give the Event a Descripton:").frame(minWidth: 285, maxWidth: 285, alignment: .bottomLeading).font(.headline)
            
            ZStack {
                VStack {
                    Text("Description").opacity(0.75).padding(.top, 0).padding(.leading, 10).frame(alignment: .leading).frame(alignment: .leading).multilineTextAlignment(.leading)
                }.frame(minWidth: 275, maxWidth: 275, alignment: .bottomLeading).foregroundColor(Color.black)
                
                TextField(eventDescription, text:$eventDescription).padding(.bottom, -5).padding(.leading, 10).foregroundColor(Color.black).frame(alignment: .leading).multilineTextAlignment(.leading).frame(minWidth: 275, maxWidth: 275, alignment: .bottomLeading).foregroundColor(Color.black)
            }
        }.frame(alignment: .leading)
    }
    
    
    
    // Create event button view
    func CustomCreateEventButton() -> some View {
        
        return
            Button(action: {
                self.addOrganizationEvent()
            }) {
                Text("Create Event")
            }.padding(.bottom, 19)
    }
}


struct NewOrganiazationEventView_Previews: PreviewProvider {
    static var previews: some View {
        AnyView(CreateOrganization())
    }
}
