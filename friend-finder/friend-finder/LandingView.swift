//
//  LandingView.swift
//  friend-finder
//
//  Created by David Guido on 11/5/19.
//  Copyright © 2019 CSUF. All rights reserved.
//

import SwiftUI

class User
{
    var uid: String
    var email: String?
    var displayName: String?
    
    init(uid: String, displayName: String?, email: String?)
    {
        self.uid = uid
        self.email = email
        self.displayName = displayName
    }
}

struct LandingView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}
