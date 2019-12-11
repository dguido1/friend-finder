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
        @Published var items: [PickUpEvent] = []
        
        var ref = Database.database().reference().child("PickupEvents")
        
        //MARK: Functions
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
        
        /*
         func getTODOS() {
             ref.observe(DataEventType.value) { (snapshot) in
                 self.items = []
                 for child in snapshot.children {
                     if let snapshot = child as? DataSnapshot,
                         let toDo = TODOS(snapshot: snapshot) {
                         self.items.append(toDo)
                     }
                 }
             }
         }
         */
        func getPickUpEvents() {
            
            ref.observe(DataEventType.value) { (snapshot) in
                    self.items = []
                    for child in snapshot.children {
                        if let snapshot = child as? DataSnapshot,
                            let event = PickUpEvent(snapshot: snapshot) {
                            self.items.append(event)
                        }
                    }
                }
        }
        /*
        func getPickUpEvents() {
            ref.child("kpztfkVAyrZxWA36fp2sArFw7Kh2").child("PickupEvents").observe(DataEventType.value) { (snapshot) in
                self.items = []
                for child in snapshot.children
                {
                    if let snapshot = child as? DataSnapshot,
                        let pickUpEvent = PickUpEvent(snapshot: snapshot)
                    {
                        self.items.append(pickUpEvent)
                    }
                }
            }
        }*/
        func uploadPickUpEvent(eventName: String, isEventStudyGroup: String, eventSubject: String, eventCourse: String, eventLocation: String, eventTime: String, eventDate: String) {

            let number = Int(Date.timeIntervalSinceReferenceDate * 1000)
            
            let postRef = ref.child(String(number))
            let post = PickUpEvent(name: eventName, isStudyGroup: isEventStudyGroup, subject: eventSubject, course: eventCourse, location: eventLocation, time: eventTime, date: eventDate)
            
            postRef.setValue(post.toAnyObject())
        }
        
        func updatePickUpEvent(key: String, eventName: String, isEventStudyGroup: String, eventSubject: String, eventCourse: String, eventLocation: String, eventTime: String, eventDate: String) {
            
            let update : [String:Any] =
                ["eventName": eventName,
                 "isEventStudyGroup": isEventStudyGroup,
                 "eventSubject": eventSubject,
                 "eventCourse": eventCourse, "eventLocation": eventLocation, "eventTime": eventTime, "eventDate": eventDate]
            
            let childUpdate = ["\(key)": update]
            ref.updateChildValues(childUpdate)
        }
    }
