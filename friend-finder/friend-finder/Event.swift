//
//  Event.swift
//  friend-finder
//
//  Created by David Guido on 11/5/19.
//  Copyright © 2019 CSUF. All rights reserved.
//

import Foundation
import Firebase

class Event : Identifiable
{

  var eventName: String
    
  var eventDay: Int
  var eventMonth: Int
  var eventTime: Int   // (24 hr) = (1440 min)
  
  init(eventName: String, eventDay: Int, eventMonth: Int, eventTime: Int)
  {
    self.eventName = eventName
    self.eventDay = eventDay
    self.eventMonth = eventMonth
    self.eventTime = eventTime
    
  }
  func placeHolder()
  {
    //self.age += 1
    //print("Happy Birthday \(self.eventName)")
  }
}
    
