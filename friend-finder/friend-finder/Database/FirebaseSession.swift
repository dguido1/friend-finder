    //
    //  FirebaseSession.swift
    //  friend-finder
    //
    //  Created by David Guido on 11/5/19.
    //  Copyright © 2019 CSUF. All rights reserved.
    //
    
    import SwiftUI
    import Firebase
    import FirebaseAuth
    import FirebaseDatabase
    import Foundation
    
    class FirebaseSession: ObservableObject {
        //MARK: Properties
        @Published var session: User?
        @Published var isLoggedIn: Bool?
        @Published var pickUpItems: [PickUpEvent] = []
        @Published var organizationItems: [OrganizationEvent] = []
        
        var pickupRef = Database.database().reference().child("PickupEvents")
        var organizationRef = Database.database().reference().child("OrganizationEvents")
        
        func listen() {
            Auth.auth().addStateDidChangeListener { (auth, user) in
                if let user = user
                {
                    self.session = User(uid: user.uid, displayName: user.displayName, email: user.email)
                    self.isLoggedIn = true
                    self.getPickUpEvents()
                }
                else
                {
                    self.isLoggedIn = false
                    self.session = nil
                }
            }
        }
        
        func logIn(email: String, password: String, handler: @escaping AuthDataResultCallback) {
            Auth.auth().signIn(withEmail: email, password: password, completion: handler)
        }
        
        func logOut() {
            try! Auth.auth().signOut()
            self.isLoggedIn = false
            self.session = nil
        }
        
        func signUp(email: String, password: String, handler: @escaping AuthDataResultCallback) {
            Auth.auth().createUser(withEmail: email, password: password, completion: handler)
        }

        func getPickUpEvents() {
            
            pickupRef.observe(DataEventType.value) { (snapshot) in
                    self.pickUpItems = []
                    for child in snapshot.children {
                        if let snapshot = child as? DataSnapshot,
                            let event = PickUpEvent(snapshot: snapshot) {
                            self.pickUpItems.append(event)
                        }
                    }
                }
        }
      
        func uploadPickUpEvent(eventName: String, eventDescription: String, isEventStudyGroup: String, eventSubject: String, eventCourse: String, eventLocation: String, eventTime: String, eventDate: String) {

            let number = Int(Date.timeIntervalSinceReferenceDate * 1000)
            
            let postRef = pickupRef.child(String(number))
            let post = PickUpEvent(name: eventName, description: eventDescription, isStudyGroup: isEventStudyGroup, subject: eventSubject, course: eventCourse, location: eventLocation, time: eventTime, date: eventDate)
            
            postRef.setValue(post.toAnyObject())
        }
        
        func updatePickUpEvent(key: String, eventName: String, eventDescription: String, isEventStudyGroup: String, eventSubject: String, eventCourse: String, eventLocation: String, eventTime: String, eventDate: String) {
            
            let update : [String:Any] =
                ["eventName": eventName, "eventDescription": eventDescription,
                 "isEventStudyGroup": isEventStudyGroup,
                 "eventSubject": eventSubject,
                 "eventCourse": eventCourse, "eventLocation": eventLocation, "eventTime": eventTime, "eventDate": eventDate]
            
            let childUpdate = ["\(key)": update]
            pickupRef.updateChildValues(childUpdate)
        }
        
          func getOrganizationEvents() {
              
             organizationRef.observe(DataEventType.value) { (snapshot) in
                      self.organizationItems = []
                      for child in snapshot.children {
                          if let snapshot = child as? DataSnapshot,
                              let event = OrganizationEvent(snapshot: snapshot) {
                            self.organizationItems.append(event)
                          }
                      }
                  }
          }
        
          func uploadOrganizationEvent(eventName: String, eventDescription: String, eventLocation: String, eventTime: String, eventDate: String) {

              let number = Int(Date.timeIntervalSinceReferenceDate * 1000)
              
              let postRef = organizationRef.child(String(number))
              let post = OrganizationEvent(name: eventName, description: eventDescription, location: eventLocation, time: eventTime, date: eventDate)
              
              postRef.setValue(post.toAnyObject())
          }
          
          func updateOrganizationEvent(key: String, eventName: String, eventDescription: String, eventLocation: String, eventTime: String, eventDate: String) {
              
              let update : [String:Any] =
                  ["eventName": eventName, "eventDescription": eventDescription, "eventLocation": eventLocation, "eventTime": eventTime, "eventDate": eventDate]
              
              let childUpdate = ["\(key)": update]
              organizationRef.updateChildValues(childUpdate)
          }
    }
