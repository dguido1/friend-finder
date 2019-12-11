    //
    //  NewPickupEventView.swift
    //  friend-finder
    //
    //  Created by David Guido on 12/4/19.
    //  Copyright © 2019 CSUF. All rights reserved.
    //
    
    import SwiftUI
    
    struct CreateStudent: View {
        
        enum PickupCategory {
            case studyGroup, meetLocation
        }
        
        // Pick up event vars
        @State var isEventStudyGroup: Bool = false
        @State var eventSubject: String = ""
        @State var eventCourse: String = ""
        
        // Event vars
        @State var eventName: String = ""
        @State var eventLocation: String = "Location00"
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
        
        // Firebase database
        @ObservedObject var session = FirebaseSession()
        @Environment(\.presentationMode) var presentationMode
        
        var body: some View {
            
            CreateStudentHandler()
        }
        
        // Function that returns correct view based on current state
        func CreateStudentHandler() -> some View {
            
            // Neither picker has been selected
            if (!showLocationPicker && !showDatePicker) {   // Show default view
                
                return AnyView(DefaultView())
            }
            else if (showLocationPicker) {   // Show location picker
                
                return AnyView(CustomFSLocationInputView().frame(alignment: .topLeading))
            }
            else {   // Show date picker
                
                return AnyView(CustomFSDateInputView().frame(alignment: .topLeading))
            }
        }
        
        func DefaultView() -> some View {
            
            return VStack {
                CustomNameInputView()
                Divider().padding(.bottom, 5).padding(.top, -5)
                CustomCategoryInputView()
                Divider().padding(.bottom, 3)
                CustomCategoryView()
                
                Button(action: {
                    self.showLocationPicker = true
                }) {
                    Text("Choose a Location")
                }.padding(.bottom, 19)
                
                Button(action: {
                    self.showDatePicker = true
                }) {
                    Text("Choose a Date & Time")
                }.padding(.bottom, 19)            }
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
                }
                
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
                        Text("Back to Create").font(.subheadline).fontWeight(.medium).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).padding(.top, 3)
                    }.padding(.bottom, 250)
                
                
                Text("Pick a Date & Time:").frame(minWidth: 250, maxWidth: 250, alignment: .leading).font(.headline)
                Text("(Restrictions: December, 6am-12am)").opacity(0.75).frame(minWidth: 250, maxWidth: 250).font(.caption)
                
                DatePicker("Event Date", selection: $selectedDate, in: range).labelsHidden()
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        }
        
        
        func dismiss() {
            presentationMode.wrappedValue.dismiss()
        }
        
        // Adds event to database
        func addPickupEvent() {
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
                
                session.uploadPickUpEvent(eventName: self.eventName, isEventStudyGroup: !self.isEventStudyGroup, eventSubject: self.eventSubject, eventCourse: self.eventCourse, eventLocation: eLocation, eventTime: eTime, eventDate: eDate)
                
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
        
        // Category toggle input view
        func CustomCategoryInputView() -> some View
        {
            return VStack {
                
                Text("Category:").frame(minWidth: 285, maxWidth: 285, alignment: .bottomLeading).font(.headline)
                
                HStack {
                    Text("Study Group").font(.caption)
                    Toggle("", isOn: $isEventStudyGroup).toggleStyle(
                        ColoredToggleStyle(
                            onColor: .green,
                            offColor: .red,
                            thumbColor: Color(UIColor.systemTeal))).labelsHidden()
                    Text("Meet Location").font(.caption)
                }
            }
        }
        
        // Category logic navigator view
        func CustomCategoryView() -> some View {
            
            if (!isEventStudyGroup)
            {
                return AnyView(CustomStudyInputView())
            }
            
            return AnyView(Divider().opacity(0))
        }
        
        // Category (Subject/course) input
        func CustomStudyInputView() -> some View
        {
            return VStack{
                HStack{
                    CustomSubjectInputView().padding(.trailing, 5)
                    CustomCourseInputView().padding(.leading, 5)
                }
                Divider().padding(.bottom, 3)
            }
        }
        
        // Subject TextField input view
        func CustomSubjectInputView() -> some View
        {
            if (eventSubject.count > 0) {
                return VStack {
                    Text("Enter Subject:").frame(minWidth: 125, maxWidth: 125, alignment: .bottomLeading).font(.headline)
                    
                    ZStack {
                        VStack {
                            Text("").opacity(0.75).padding(.top, 6).padding(.leading, 10).frame(alignment: .leading).frame(alignment: .leading).multilineTextAlignment(.leading)
                        }.frame(minWidth: 100, maxWidth: 100, alignment: .bottomLeading).foregroundColor(Color.black)
                        
                        TextField(eventSubject, text:$eventSubject).padding(.bottom, -5).padding(.leading, 10).foregroundColor(Color.black).frame(alignment: .leading).multilineTextAlignment(.leading).frame(minWidth: 100, maxWidth: 100, alignment: .bottomLeading).foregroundColor(Color.black)
                    }
                }.frame(alignment: .leading)
            }
            
            return VStack {
                Text("Enter Subject:").frame(minWidth: 125, maxWidth: 125, alignment: .bottomLeading).font(.headline)
                
                ZStack {
                    VStack {
                        Text("Subject").opacity(0.75).padding(.top, 0).padding(.leading, 10).frame(alignment: .leading).frame(alignment: .leading).multilineTextAlignment(.leading)
                    }.frame(minWidth: 100, maxWidth: 100, alignment: .bottomLeading).foregroundColor(Color.black)
                    
                    TextField(eventSubject, text:$eventSubject).padding(.bottom, -5).padding(.leading, 10).foregroundColor(Color.black).frame(alignment: .leading).multilineTextAlignment(.leading).frame(minWidth: 100, maxWidth: 100, alignment: .bottomLeading).foregroundColor(Color.black)
                }
            }.frame(alignment: .leading)
        }
        
        // Course TextField input view
        func CustomCourseInputView() -> some View
        {
            if (eventCourse.count > 0) {
                return VStack {
                    Text("Enter Course:").frame(minWidth: 125, maxWidth: 125, alignment: .bottomLeading).font(.headline)
                    
                    ZStack {
                        VStack {
                            Text("").opacity(0.75).padding(.top, 6).padding(.leading, 10).frame(alignment: .leading).frame(alignment: .leading).multilineTextAlignment(.leading)
                        }.frame(minWidth: 100, maxWidth: 100, alignment: .bottomLeading).foregroundColor(Color.black)
                        
                        TextField(eventCourse, text:$eventCourse).padding(.bottom, -5).padding(.leading, 10).foregroundColor(Color.black).frame(alignment: .leading).multilineTextAlignment(.leading).frame(minWidth: 100, maxWidth: 100, alignment: .bottomLeading).foregroundColor(Color.black)
                    }
                }.frame(alignment: .leading)
            }
            
            return VStack {
                Text("Enter Course:").frame(minWidth: 125, maxWidth: 125, alignment: .bottomLeading).font(.headline)
                
                ZStack {
                    VStack {
                        Text("Course").opacity(0.75).padding(.top, 0).padding(.leading, 10).frame(alignment: .leading).frame(alignment: .leading).multilineTextAlignment(.leading)
                    }.frame(minWidth: 100, maxWidth: 100, alignment: .bottomLeading).foregroundColor(Color.black)
                    
                    TextField(eventCourse, text:$eventCourse).padding(.bottom, -5).padding(.leading, 10).foregroundColor(Color.black).frame(alignment: .leading).multilineTextAlignment(.leading).frame(minWidth: 100, maxWidth: 100, alignment: .bottomLeading).foregroundColor(Color.black)
                }
            }.frame(alignment: .leading)
        }
        
        // Create event button view
        func CustomCreateEventButton() -> some View {
            if (!isEventStudyGroup)
            {
                return
                    Button(action: {
                        self.addPickupEvent()
                    }) {
                        Text("Create Event")
                    }.padding(.bottom, 19)
            }
            
            return Button(action: {
                self.addPickupEvent()
            }) {
                Text("Create Event")
            }.padding(.bottom, 0)
        }
    }
    
    struct NewPickupEventView_Previews: PreviewProvider {
        static var previews: some View {
            AnyView(CreateStudent())
        }
    }
