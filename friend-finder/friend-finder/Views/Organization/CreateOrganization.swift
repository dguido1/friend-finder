//
//  CreateOrganization.swift
//  friend-finder
//
//  Created by David Guido on 12/9/19.
//  Copyright © 2019 CSUF. All rights reserved.
//

import SwiftUI

struct CreateOrganization: View {

    // Event vars
    @State var eventName: String = ""
    @State var roomName: String = ""
    @State var eventLocation: String = "Library"
    @State var eventLocationPool = ["Library", "TitanStudentUnion", "CS Building", "Engineering Building","EC Building", "McCarthy Hall", "Student Housing", "Humanities Building","University Hall", "Langsdorf Hall"]
    @State var selectedLocation = 4
    @State var eventDate: Date = Date()
    
    @State var eventDescription: String = "N/A"

    // Event helper vars
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
    @State private var selectedDate = Date()   // Date picker selection
    @State var currentDate = Date()   // Current date/time

    // Firebase database
    @ObservedObject var session = FirebaseSession()
    @Environment(\.presentationMode) var presentationMode


    var body: some View {
            Group {
                VStack {

                    VStack {
                        CustomNameInputView()
                        Divider().padding(.bottom, 5).padding(.top, -5)
                        CustomRoomNameInputView()
                        Divider().padding(.bottom, 5).padding(.top, -5)
                        CustomLocationInputView().padding(.trailing, 35).padding(.bottom, -20).frame(minWidth: 200, maxWidth: 200).padding(.bottom, 3)
                        CustomDateInputView().padding(.trailing, 35)
                    }.frame(alignment: .topLeading)

                    CustomCreateEventButton()

                }.frame(alignment: .topLeading)
            }
            .padding()
        }

        func dismiss() {
            presentationMode.wrappedValue.dismiss()
        }

        // Adds event to database
        func addEvent() {
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
                // Event Name Insertion
                //session.uploadEvent(eventName: self.eventName, eventDescription: eventDescription, eventLocation: eLocation, eventTime: eTime, eventDate: eDate)

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
                Text("Name the Organization's Event:").frame(minWidth: 285, maxWidth: 285, alignment: .bottomLeading).font(.headline)

                ZStack {
                    VStack {
                        Text("Name").opacity(0.75).padding(.top, 0).padding(.leading, 10).frame(alignment: .leading).frame(alignment: .leading).multilineTextAlignment(.leading)
                    }.frame(minWidth: 275, maxWidth: 275, alignment: .bottomLeading).foregroundColor(Color.black)

                    TextField(eventName, text:$eventName).padding(.bottom, -5).padding(.leading, 10).foregroundColor(Color.black).frame(alignment: .leading).multilineTextAlignment(.leading).frame(minWidth: 275, maxWidth: 275, alignment: .bottomLeading).foregroundColor(Color.black)
                }
            }.frame(alignment: .leading)
        }


        // Name TextField input view for meeting room location
        func CustomRoomNameInputView() -> some View
        {
            if (roomName.count > 0) {
                return VStack {
                    Text("Meeting Room Location: ").frame(minWidth: 285, maxWidth: 285, alignment: .bottomLeading).font(.headline)

                    ZStack {
                        VStack {
                            Text("").opacity(0.75).padding(.top, 6).padding(.leading, 10).frame(alignment: .leading).frame(alignment: .leading).multilineTextAlignment(.leading)
                        }.frame(minWidth: 275, maxWidth: 275, alignment: .bottomLeading).foregroundColor(Color.black)

                        TextField(roomName, text:$roomName).padding(.bottom, -5).padding(.leading, 10).foregroundColor(Color.black).frame(alignment: .leading).multilineTextAlignment(.leading).frame(minWidth: 275, maxWidth: 275, alignment: .bottomLeading).foregroundColor(Color.black)
                    }
                }.frame(alignment: .leading)
            }

            return VStack {
                Text("Meeting Room Location: ").frame(minWidth: 285, maxWidth: 285, alignment: .bottomLeading).font(.headline)

                ZStack {
                    VStack {
                        Text("Name").opacity(0.75).padding(.top, 0).padding(.leading, 10).frame(alignment: .leading).frame(alignment: .leading).multilineTextAlignment(.leading)
                    }.frame(minWidth: 275, maxWidth: 275, alignment: .bottomLeading).foregroundColor(Color.black)

                    TextField(roomName, text:$roomName).padding(.bottom, -5).padding(.leading, 10).foregroundColor(Color.black).frame(alignment: .leading).multilineTextAlignment(.leading).frame(minWidth: 275, maxWidth: 275, alignment: .bottomLeading).foregroundColor(Color.black)
                }
            }.frame(alignment: .leading)
        }





        // Location Picker input view



        func CustomLocationInputView() -> some View {

                return VStack{
                    Text("Pick a Location:").frame(minWidth: 250, maxWidth: 250, alignment: .leading).font(.headline)

                    Picker(selection: $selectedLocation, label: Text("Please choose a location")) {
                        ForEach(0 ..< eventLocationPool.count) {
                            Text(self.eventLocationPool[$0])
                        }
                    }.labelsHidden().padding(.top, -20)
                }.padding(.top, 5)
            

        }

        // Location DatePicker input view
        func CustomDateInputView() -> some View {
            var endComponents = DateComponents()
            endComponents.month = 12
            endComponents.year = 2019
            endComponents.day = 31
            endComponents.minute = 59
            endComponents.hour = 23

            let endDate = Calendar.current.date(from: endComponents) ?? Date()
            let range = Date() ... endDate

            return VStack {

                Text("Pick a Date & Time:").frame(minWidth: 250, maxWidth: 250, alignment: .leading).font(.headline)
                Text("(Restrictions: December, 6am-12am)").opacity(0.75).frame(minWidth: 250, maxWidth: 250).font(.caption)

                DatePicker("Event Date", selection: $selectedDate, in: range).labelsHidden().padding(.top, -30).frame(minWidth: 125, maxWidth: 125)
            }
        }

        // Create event button view
        func CustomCreateEventButton() -> some View {

                return
                    Button(action: {
                        self.addEvent()
                    }) {
                        Text("Create Event")
                    }.padding(.bottom, 19)
            }
}

struct CreateOrganization_Previews: PreviewProvider {
    static var previews: some View {
        CreateOrganization()
    }
}
