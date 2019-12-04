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

struct PickUpEvent: Identifiable
{
 
       // var ref: DatabaseReference!

        //ref = Database.database().reference()
    // Database management
        let ref: DatabaseReference?
        let key: String
        let id: String
    
        // Pick Up Event
        var cwid: String
    
        // Event
        var eventName: String
        var eventDay: Int
        var eventMonth: Int
        var eventTime: Int      // (24 hr) = (1440 min)
    
        init(studentID: String, name: String, day: Int, month: Int, time: Int, key: String = "")
        {
            self.ref = nil
            self.key = key
            self.id = key
        
            self.cwid = studentID
            self.eventName = name
            self.eventDay = day
            self.eventMonth = month
            self.eventTime = time
        }
        
        init?(snapshot: DataSnapshot)
        {
            guard
                let value = snapshot.value as? [String: AnyObject],
                
                let cwid = value["cwid"] as? String,
                let eventName = value["eventName"] as? String,
                let eventDay = value["eventDay"] as? Int,
                let eventMonth = value["eventMonth"] as? Int,
                let eventTime = value["eventTime"] as? Int
                else
                {
                    return nil
                }
            
            // Database management
            self.ref = snapshot.ref
            self.key = snapshot.key
            self.id = snapshot.key
            
            // Pick Up Event
            self.cwid = cwid

            // Event
            self.eventName = eventName
            self.eventDay = eventDay
            self.eventMonth = eventMonth
            self.eventTime = eventTime
        }
        
        func toAnyObject() -> Any {
            return [
                "cwid": cwid,
                "eventName": eventName,
                "eventDay": eventDay,
                "eventMonth": eventMonth,
                "eventTime": eventTime,
            ]
        }
      
}
    

