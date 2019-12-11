    //
    //  SearchView.swift
    //
    //  Friend Finder, CPSC 362, M/W: 11:00am-12:50pm
    //  CSUF Fall 2019
    //
    //  Created by David Guido, Pierce Findlay & Kayla Nguyen on 11/01/2019.
    
    import SwiftUI
    
    struct Search: View {
        
        var puEvents = [PickUpEvent]()
        var index: Int = 0

        
        @ObservedObject var session = FirebaseSession()
        
        var body: some View {
            
            return Spacer()
        }
        
        func PopulatePUEvent() -> some View {
            
             var currentString: String = ""

            currentString = "Array length " + String(session.pickUpItems.count)

            
            
            return Text (currentString)
            

        }

        //MARK: Functions
        func getUser() {
            session.listen()
        }
        
        //MARK: Functions
        func getPUEvents() {
            session.getPickUpEvents()
        }
        
        func DetailPUEventView(pickUpEvent: PickUpEvent) -> some View {
            
            HStack {
                Text(pickUpEvent.name)
                
                Spacer()
                
                if pickUpEvent.isStudyGroup == "true" {
                    Image(systemName: "checkmark").imageScale(.medium)
                } else {
                    Image(systemName: "xmark").imageScale(.medium)
                }
            }
            
            
        }
    }
    
    struct Search_Previews: PreviewProvider {
        static var previews: some View {
            Search()
        }
    }
