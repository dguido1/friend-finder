//
//  StoreView.swift
//
//  Friend Finder, CPSC 362, M/W: 11:00am-12:50pm
//  CSUF Fall 2019
//
//  Created by David Guido, Pierce Findlay & Kayla Nguyen on 11/01/2019.

import SwiftUI

struct ProfileView: View
{
    var body: some View
    {
        VStack(spacing: 50)
        {
            Spacer()
            
            /*
             
         
            ProfileItem(image: "image2", text1: "Rebeloper Store", text2: "The Ultimate In-app Purchases Guide for iOS and Swift")
            Divider()
            ProfileItem(image: "image3", text1: "YouTube Channel Resources", text2: "Code Better and Get More Downloads")
     */
        }
            
        .padding(20)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct ProfileItem : View {
    
    var image : String
    var text1 : String
    var text2 : String
    
    var body : some View {
        return
            VStack {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                VStack(alignment: .leading) {
                    Text(text1)
                        .font(.title)
                    //                    .lineLimit(2)
                    Text(text2)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
        }
    }
}
