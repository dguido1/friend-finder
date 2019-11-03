//
//  AboutUsView.swift
//
//  Friend Finder, CPSC 362, M/W: 11:00am-12:50pm
//  CSUF Fall 2019
//
//  Created by David Guido, Pierce Findlay & Kayla Nguyen on 11/01/2019.

import SwiftUI

struct CreateView: View {
    
    @State var showDetails1 = false
    @State var showDetails2 = false
    @State var showDetails3 = false
    
    var body: some View {
        VStack {
            Spacer()
            
            /*
            Person(showDetail: $showDetails1, image: "Alex", text: "I am a senior iOS developer with more than 8 years of experience in building scalable, high quality iOS apps.")
            
            
            Person(showDetail: $showDetails2, image: "Agi", text: "I am responsible for creating, optimizing, and maintaining Rebeloper’s traffic system with the goals of customer acquisition and revenue.")
            
            Person(showDetail: $showDetails3, image: "Alpar", text: "I am the frontend developer at Rebeloper. I mainly use SwiftUI and Combine, but I am knowledgable in UIKit too. Laying out Views - part of the daily hustle!")
              */
 
 } .padding(.horizontal, 20)
    }
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView()
    }
}

struct Person : View {
    
    @Binding var showDetail : Bool
    
    var image : String
    var text : String
    
    var body : some View {
        return   GeometryReader { geometry in
            HStack {
                Image(self.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geometry.size.width / 2)
                    .cornerRadius(10)
                Spacer()
                VStack {
                    HStack {
                        Text(self.image)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        Button(action: {
                            self.showDetail.toggle()
                        }) {
                            Image(systemName: "chevron.down.circle")
                                .font(.title)
                                .rotationEffect(.degrees(self.showDetail ? 0: -180))
                                .animation(.default)
                        }
                    }.offset(y: self.showDetail ? 0 : geometry.size.height / 10)
                        .animation(.easeInOut(duration: 0.5))
                    Text(self.text)
                        .opacity(self.showDetail ? 1 : 0)
                        .animation(Animation.easeInOut(duration: 2).speed(3))
                }.frame(width: geometry.size.width / 2)
            }
        }
    }
}
