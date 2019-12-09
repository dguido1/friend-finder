    //
    //  NewPickupEventView.swift
    //  friend-finder
    //
    //  Created by David Guido on 12/4/19.
    //  Copyright © 2019 CSUF. All rights reserved.
    //
    
    import SwiftUI
    
    struct NewPickupEventView: View {
        
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
        @State var eventLocationPool = ["Location00", "Location01", "Location02", "Location03",
                                        "Location04", "Location05", "Location06", "Location07",
                                        "Location08", "Location09"]
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
        
        // Firebase database
        @ObservedObject var session = FirebaseSession()
        @Environment(\.presentationMode) var presentationMode
        
        var body: some View {
            Group {
                VStack {
                    
                 //   VStack (alignment: .leading) {
                        // Date text ('Sat' hard-coded + call to current date function)
                       // Text ("Saturday, \(currentDate, formatter: dateFormatter)").font(.subheadline).bold().multilineTextAlignment(.leading).foregroundColor(Color.gray)
                        
                    //    HStack{
                        //    Text ("Create").font(.title).fontWeight(.bold).bold().foregroundColor(Color.black)
                        //    Text ("Student | Pick Up Group").font(.headline).fontWeight(.bold).bold().foregroundColor(Color.black).padding(.top, 7).padding(.leading, 10)
                            
                     //   }.frame(alignment: .bottom)
                        
                        // Line divider
                   //     Divider().padding(.top, -15)
                        
                 //   }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 75, maxHeight: 75, alignment: Alignment.topLeading).padding(.top, 30)
                
                    VStack {
                        CustomNameInputView()
                        Divider().padding(.bottom, 5).padding(.top, -5)
                        CustomCategoryInputView()
                        Divider().padding(.bottom, 3)
                        CustomCategoryView()
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
        func addPickupEvent() {
            if !eventName.isEmpty {
                
                //Add PU Event to Firebase
                // func uploadPickUpEvent(id: String, name: String, day: Int, month: Int, time: Int) {
                // func uploadPickUpEvent(name: String, isStudyGroup: isEventStudyGroup,day: Int, month: Int, time: Int) {
                
                //session.uploadPickUpEvent(id: cwid, name: eventName, day: eventDay, month: eventMonth, time: eventTime)
                session.uploadPickUpEvent(eventName: eventName, isEventStudyGroup: isEventStudyGroup, eventSubject: eventSubject, eventCourse: eventCourse, eventLocation: eventLocation, eventDate: eventDate){
                    (result, error) in
                    if error != nil {
                        print("Error")
                    }
           
                }
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
        
        // Location Picker input view
        func CustomLocationInputView() -> some View {
            
            if (!isEventStudyGroup)
            {
                return VStack{
                    Text("Pick a Location:").frame(minWidth: 250, maxWidth: 250, alignment: .leading).font(.headline)
                    
                    Picker(selection: $selectedLocation, label: Text("Please choose a location")) {
                        ForEach(0 ..< eventLocationPool.count) {
                            Text(self.eventLocationPool[$0])
                        }
                    }.labelsHidden().padding(.top, -20)
                }.padding(.top, 5)
            }
            else
            {
                return VStack{
                    Text("Pick a Location:").frame(minWidth: 250, maxWidth: 250, alignment: .leading).font(.headline)
                    
                    Picker(selection: $selectedLocation, label: Text("Please choose a location")) {
                        ForEach(0 ..< eventLocationPool.count) {
                            Text(self.eventLocationPool[$0])
                        }
                    }.labelsHidden().padding(.top, -20)
                }.padding(.top, 5)
            }
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
            AnyView(NewPickupEventView())
        }
    }
