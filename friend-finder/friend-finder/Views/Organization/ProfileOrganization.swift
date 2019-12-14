//
//  ProfileOrganization.swift
//  friend-finder
//
//  Created by David Guido on 12/9/19.
//  Copyright © 2019 CSUF. All rights reserved.
//

import SwiftUI

struct ProfileOrganization: View {
    var body: some View {
        
    // Parent container (Full view)
              VStack {
                  // ProfileInfo container
                  organizationProfileInfo (profilePicture: "shpacsuf", orgAcronym: "N.A.M.E", orgName: "Organization Name")
                  
                  Divider()
            HStack {
                VStack{
                // Subscribers button
                Button(action: {
                    
                }) {
                    Text("4").font(.subheadline).fontWeight(.medium).frame(minWidth: 0, maxWidth: .infinity, alignment: .center).padding(.top, 3)
                }
                
                Text("Subscribers ").foregroundColor(Color.gray).frame(minWidth: 0, maxWidth: .infinity, alignment: .center).padding(.top, 3)
                    }
                    
                VStack {
                    
                Button(action: {
                    
                }) {
                    Text("17").font(.subheadline).fontWeight(.medium).frame(minWidth: 0, maxWidth: .infinity, alignment: .center).padding(.top, 3)
                }
                
                Text("Events Hosted ").foregroundColor(Color.gray).frame(minWidth: 0, maxWidth: .infinity, alignment: .center).padding(.top, 3)
                    }
                
                VStack {
                    
                Button(action: {
                    
                }) {
                    Text("3").font(.subheadline).fontWeight(.medium).frame(minWidth: 0, maxWidth: .infinity, alignment: .center).padding(.top, 3)
                }
                
                Text("Awards ").foregroundColor(Color.gray).frame(minWidth: 0, maxWidth: .infinity, alignment: .center).padding(.top, 3)
                    }
                    
                }
                  Divider()
                  
                   NavigationView {
                  
                           HStack {
                               Text("No recent events.\nHost some in the Create tab.").font(.caption).fontWeight(.bold).multilineTextAlignment(.center)
                      
                           
                       }
                       .navigationBarItems(leading:
                       Spacer()
                           
                       ).navigationBarTitle(Text("Recent Events"), displayMode: .automatic).lineLimit(100)
                   }.padding(.bottom, 100)
                  
              // Parent container formatting
              }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top).padding(.top, 35).lineLimit(100)
    }
}

struct organizationProfileInfo : View {
       var profilePicture : String
       var orgAcronym : String
       var orgName : String
       
       var body : some View {
                  // ProfileInfo parent container
           return HStack {
                       ZStack {
                           
                           // Profile image overlay
                           Image("ProfilePicOverlay01").resizable().aspectRatio(contentMode: .fit).shadow(radius: 40).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)

                           // Profile image
                           Image(profilePicture).resizable().aspectRatio(contentMode: .fit).overlay(RoundedRectangle(cornerRadius: 100).stroke(Color.blue, lineWidth: 15)).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity).aspectRatio(contentMode: .fit).frame(minHeight: 0, maxHeight: 100).cornerRadius(100).shadow(radius: 40)
                           
                       }.frame(minWidth: 0, maxWidth: 150, minHeight: 0, maxHeight: 175)
               
                       // Horizontal spacing
                       Text("   ")
                       
                       // Profile title texts vertical stack
                       VStack {
                           Text (orgAcronym).font(.title).fontWeight(.bold).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                           Text(orgName).font(.subheadline).fontWeight(.medium).foregroundColor(.gray).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                           
                           // Edit profile button
                           Button(action:
                           {
                               
                           }) {
                               Text("Edit Profile").font(.subheadline).fontWeight(.medium).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).padding(.top, 3)
                           }
                       
                       // Profile title texts vertical stack formatting
                       }.frame(minWidth: 0, maxWidth: 175, alignment: .leading)
                   
               // ProfileInfo parent container formatting
           }.frame(minWidth: 0, maxWidth: .infinity, alignment: Alignment.top)
       }
   }

struct ProfileOrganization_Previews: PreviewProvider {
    static var previews: some View {
        ProfileOrganization()
    }
}
