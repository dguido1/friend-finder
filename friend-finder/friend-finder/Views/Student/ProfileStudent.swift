    //
    //  ProfileView.swift
    //
    //  Friend Finder, CPSC 362, M/W: 11:00am-12:50pm
    //  CSUF Fall 2019
    //
    //  Created by David Guido, Pierce Findlay & Kayla Nguyen on 11/01/2019.

    import SwiftUI

    struct ProfileStudent: View {
        var body: some View {
            // Parent container (Full view)
            VStack {
                // ProfileInfo container
                ProfileInfo (profilePicture: "Alpar", studentName: "Student Name", studentCity: "City")
                
                Divider()
                
                Text("Member of ").foregroundColor(Color.gray) + Text("0").bold().fontWeight(.heavy).foregroundColor(Color.gray) + Text(" Campus Clubs").foregroundColor(Color.gray)
                // Edit profile button
                Button(action: {
                    
                }) {
                    Text("Find More").font(.subheadline).fontWeight(.medium).frame(minWidth: 0, maxWidth: .infinity, alignment: .center).padding(.top, 3)
                }

                Divider()
                
                NavigationView {
               
                        HStack {
                            Text("No recent events.\nFind some in the Discover or Search tab.").font(.caption).fontWeight(.bold).multilineTextAlignment(.center)
                   
                        
                    }
                    .navigationBarItems(leading:
                    Spacer()
                        
                    ).navigationBarTitle(Text("Recent Events"), displayMode: .automatic).lineLimit(100)
                }.padding(.bottom, 100)
                
            // Parent container formatting
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top).padding(.top, 35).lineLimit(100)
        }
    }

    struct EventItemButton : View {
        var iconColor : Color
        var eventIcon : String
        var nameText : String
        var dateText : String
        var likesText : String

        var body : some View {
                    // EventItemButton parent container
            return  Button(action:{})
                    {
                        HStack {
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                 .fill(iconColor)
                                .frame(width: 30, height: 30).overlay(Image(systemName: eventIcon).font(.footnote).foregroundColor(Color.white))
                            
                            VStack {
                                Text(nameText).font(.subheadline).foregroundColor(Color.black).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).aspectRatio(contentMode: .fill)
                                Text(dateText).font(.subheadline).foregroundColor(Color.gray).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            }
                            
                            Text (likesText).font(.subheadline).foregroundColor(Color.gray)
                            
                        // EventItemButton parent container formatting
                        }.frame(minWidth: 0, maxWidth: 350, minHeight: 0, maxHeight: 45, alignment: Alignment.leading)
                    }
        }
    }

    struct ProfileInfo : View {
        var profilePicture : String
        var studentName : String
        var studentCity : String
        
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
                            Text (studentName).font(.headline).fontWeight(.bold).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            Text(studentCity).font(.subheadline).fontWeight(.medium).foregroundColor(.gray).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            
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

    struct ProfileStudent_Previews: PreviewProvider {
        static var previews: some View {
            ProfileStudent()
        }
    }

    /*
     

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
     */
