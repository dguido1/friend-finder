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
        
        func uploadPickUpEvent(id: String, name: String, day: Int, month: Int, time: Int) {
            //Generates number going up as time goes on, sets order of TODO's by how old they are.
            let number = Int(Date.timeIntervalSinceReferenceDate * 1000)
            
            let postRef = ref.child(String(number))
            
            let post = PickUpEvent(studentID: id, name: name, day: day, month: month, time: time)
            postRef.setValue(post.toAnyObject())
        }

        func updatePickUpEvent(key: String, cwid: String, eventName: String, eventDay: Int, eventMonth: Int, eventTime: Int) {
            let update : [String:Any] = ["cwid": cwid, "eventName": eventName, "eventDay": eventDay, "eventMonth": eventMonth, "eventTime": eventTime]

            let childUpdate = ["\(key)": update]
            ref.updateChildValues(childUpdate)
        }
    }
