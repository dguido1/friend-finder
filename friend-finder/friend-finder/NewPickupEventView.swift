    //
    //  NewPickupEventView.swift
    //  friend-finder
    //
    //  Created by David Guido on 12/4/19.
    //  Copyright © 2019 CSUF. All rights reserved.
    //

    import SwiftUI

    struct NewPickupEventView: View {
                 // Pick Up Event
                @State var cwid: String
            
                 // Event
              //   var eventName: String
              //   var eventDay: Int
              //   var eventMonth: Int
               //  var eventTime: Int      // (24 hr) = (1440 min)
        
        

            @ObservedObject var session = FirebaseSession()
            
            @Environment(\.presentationMode) var presentationMode
            
            
            var body: some View {
                Group {
                    VStack {
                      
                        HStack {
                            TextField("Enter your campus ID", text: $cwid)
                                .padding()
                        }
                        
    /*                    HStack {
                            TextField("Enter event name", text: $eventName)
                                .padding()
                        }
                        HStack {
                            TextField("Enter event day",text: $eventDay)
                                .padding()
                        }
                        HStack {
                            TextField("Enter event month", text: $eventMonth)
                                .padding()
                        }
                        HStack {
                            TextField("Enter event time", text: $eventTime)
                                .padding()
                        }
        */
                        Button(action: {
                            self.addPickupEvent()
                        }) {
                            Text("Add")
                        }
                    }
                }
                .padding()
            }
            
            func addPickupEvent() {
               // if !newPUEvent.isEmpty {
                    
                    //Add PU Event to Firebase
                    
                    // func uploadPickUpEvent(id: String, name: String, day: Int, month: Int, time: Int)

                session.uploadPickUpEvent(id: "000000000", name: "name", day: 0, month: 0, time: 0)
                    dismiss()
             //   }
            }
            
            func dismiss() {
                presentationMode.wrappedValue.dismiss()
            }
        }

    struct NewPickupEventView_Previews: PreviewProvider {
        static var previews: some View {
            NewPickupEventView(cwid: "000000000")
        }
    }
