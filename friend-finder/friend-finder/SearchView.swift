//
//  SearchView.swift
//
//  Friend Finder, CPSC 362, M/W: 11:00am-12:50pm
//  CSUF Fall 2019
//
//  Created by David Guido, Pierce Findlay & Kayla Nguyen on 11/01/2019.

import SwiftUI

struct SearchView: View
{
    
        var body: some View
        {
                        
            HStack()
            {
                Spacer()
                VStack
                {
                    Text("Is Complete")
                }
            }
            .padding()
        }
}
    
    struct SearchView_Previews: PreviewProvider {
        static var previews: some View {
            SearchView()
        }
    }
        /*
     
=
        func setupButton() {
            if todo.isComplete == "true" {
                complete = true
            } else {
                complete = false
            }
        }
        
        func buttonPressed() {
            if complete == true {
                self.complete = false
                self.session.updateTODO(key: todo.key, todo: todo.todo, isComplete: "false")
                print("buttonpressed ran, should set complete, complete is: \(String(describing: self.complete))")
            } else {
                self.complete = true
                self.session.updateTODO(key: todo.key, todo: todo.todo, isComplete: "true")
                print("buttonpressed ran, should set incomplete, complete is \(String(describing: self.complete))")
            }
        }
      */

