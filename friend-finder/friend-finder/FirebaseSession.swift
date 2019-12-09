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
    
    class FirebaseSession: ObservableObject {
        //MARK: Properties
        @Published var session: User?
        @Published var isLoggedIn: Bool?
        @Published var items: [PickUpEvent] = []
        
        var ref: DatabaseReference = Database.database().reference(withPath: "\(String(describing: Auth.auth().currentUser?.uid ?? "Error"))")
        
        //MARK: Functions
        func listen() {
            _ = Auth.auth().addStateDidChangeListener { (auth, user) in
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
            ref.observe(DataEventType.value) { (snapshot) in
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
        }
        
        func uploadPickUpEvent(eventName: String, isEventStudyGroup: Bool, eventSubject: String, eventCourse: String, eventLocation: String, eventDate: Date, handler: @escaping AuthDataResultCallback) {
            //Generates number going up as time goes on, sets order of TODO's by how old they are.
            let number = Int(Date.timeIntervalSinceReferenceDate * 1000)
            
            let postRef = ref.child(String(number))
            
            // init(name: String, isStudyGroup: Bool, subject: String, course: String, location: String, date: Date, key: String = ""){..}
            let post = PickUpEvent(name: eventName, isStudyGroup: isEventStudyGroup, subject: eventSubject, course: eventCourse, location: eventLocation, date: eventDate)
            postRef.setValue(post.toAnyObject())
        }
        
        func updatePickUpEvent(key: String, eventName: String, isEventStudyGroup: Bool, eventSubject: String, eventCourse: String, eventLocation: String, eventDate: Date) {
            
            let update : [String:Any] = ["eventName": eventName, "isEventStudyGroup": isEventStudyGroup, "eventSubject": eventSubject, "eventCourse": eventCourse, "eventLocation": eventLocation, "eventDate": eventDate]
            
            let childUpdate = ["\(key)": update]
            ref.updateChildValues(childUpdate)
        }
    }
