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
        
        // Date function, returns current date
        static let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter
        }()
        
        var now = Date()
        
        var body: some View {
            
            return PopulateEvents().padding(15)
        }
        
        func PopulateEvents() -> some View {
            
            let studentEvents = session.pickUpItems
            let organizationEvents = session.organizationItems
            
            getPUEvents()
            getOrganizationEvents()

            return VStack {
                HStack {                        // Title container
                    VStack (alignment: .leading) {
                        
                        // Date text ('Sat' hard-coded + call to current date function)
                        Text ("Saturday, \(now, formatter: Self.dateFormatter)").font(.subheadline).bold().multilineTextAlignment(.leading).foregroundColor(Color.gray)
                        Text ("Search").font(.largeTitle).fontWeight(.bold).bold().foregroundColor(Color.black)
                        
                        // Line divider
                        Divider().padding(.vertical, -15)
                        
                    }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 75, alignment: Alignment.top)
                    
                    // Settings button
                    Button(action:
                        {
                            // Add an action here
                    }, label:
                        {
                            Image(systemName: "gear").font(.title).foregroundColor(.gray)
                    })
                    
                    // Navbar container formatting
                }.frame(minWidth: 0, maxWidth: .infinity, alignment: Alignment.top).padding(.horizontal, 30)
                Text("Student Events: ").font(.headline).fontWeight(.bold).multilineTextAlignment(.center)
                
                List(studentEvents) { pickUpEvent in
                    PickupRow(pickUpEvent: pickUpEvent)
                }
                
                
                Text("Organization Events: ").font(.headline).fontWeight(.bold).multilineTextAlignment(.center)
                
                List(organizationEvents) { organizationEvent in
                  OrganizationRow(organizationEvent: organizationEvent)
                }
            }
                
        }

        //MARK: Functions
        func getUser() {
            session.listen()
        }
        
        //MARK: Functions
        func getPUEvents() {
            session.getPickUpEvents()
        }
        
        func getOrganizationEvents() {
            session.getOrganizationEvents()
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
    struct PickupRow: View {
        var pickUpEvent: PickUpEvent

        var body: some View {
            Text("Name: \(pickUpEvent.name)")
        }
    }

    struct OrganizationRow: View {
        var organizationEvent: OrganizationEvent

        var body: some View {
            Text("Name: \(organizationEvent.name)")
        }
    }
    
    struct Search_Previews: PreviewProvider {
        static var previews: some View {
            Search()
        }
    }
