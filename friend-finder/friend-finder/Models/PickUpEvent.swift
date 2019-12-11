
    //
    //  PickUpEvent.swift
    //  friend-finder
    //
    //  Created by David Guido on 11/5/19.
    //  Copyright © 2019 CSUF. All rights reserved.
    //
    
    import Foundation
    import Firebase
    
    import SwiftUI
    import FirebaseDatabase
    
    struct PickUpEvent: Identifiable {

        // Database
        let ref: DatabaseReference?
        let key: String
        let id: String
        
        // Pick Up Event
        var isStudyGroup: String
        var subject: String
        var course: String
        
        // Event
        var name: String
        var location: String
        
        var time: String   // Time conv
        var date: String
        
        init(name: String, isStudyGroup: String, subject: String, course: String, location: String, time: String, date: String, key: String = "") {

            self.ref = nil
            self.key = key
            self.id = key
            
            self.name = name
            self.isStudyGroup = isStudyGroup
            self.subject = subject
            self.course = course
            self.location = location
            self.time = time
            self.date = date
        }
        
        init?(snapshot: DataSnapshot) {
            guard
                let value = snapshot.value as? [String: AnyObject],
                let name = value["name"] as? String,
                let isStudyGroup = value["isStudyGroup"] as? String,
                let subject = value["subject"] as? String,
                let course = value["course"] as? String,
                let location = value["location"] as? String,
                let time = value["time"] as? String,
                let date = value["date"] as? String
                else {
                    return nil
                }
            
            // Database management
            self.ref = snapshot.ref
            self.key = snapshot.key
            self.id = snapshot.key
            
            self.name = name
            self.isStudyGroup = isStudyGroup
            self.subject = subject
            self.course = course
            self.location = location
            self.time = time
            self.date = date
        }
        
        func toAnyObject() -> Any {
            return [
                "name": name,
                "isStudyGroup": isStudyGroup,
                "subject": subject,
                "course": course,
                "location": location,
                "time": time,
                "date": date
            ]
        }
    }

    
