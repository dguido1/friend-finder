    
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
    
    struct OrganizationEvent: Identifiable {

        // Database
        let ref: DatabaseReference?
        let key: String
        let id: String
        
        // Event
        var name: String
        var description: String
        var location: String
        
        var time: String   // Time conv
        var date: String
        
        init(name: String, description: String, location: String, time: String, date: String, key: String = "") {

            self.ref = nil
            self.key = key
            self.id = key
            
            self.name = name
            self.description = description
            self.location = location
            self.time = time
            self.date = date
        }
        
        init?(snapshot: DataSnapshot) {
            guard
                let value = snapshot.value as? [String: AnyObject],
                let name = value["name"] as? String,
                let description = value["description"] as? String,
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
            self.description = description
            self.location = location
            self.time = time
            self.date = date
        }
        
        func toAnyObject() -> Any {
            return [
                "name": name,
                "description": description,
                "location": location,
                "time": time,
                "date": date
            ]
        }
    }

    
