&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="https://github.com/dguido1/friend-finder/blob/master/friend-finder/images/logos/FriendFinderLogoColor.svg" alt="alt text" width="100px" height="auto">

# Friend Finder
## It's time, link-up with CSUF peers now <br>

### a Native iOS application built with ***[SwiftUI](https://developer.apple.com/xcode/swiftui/)***
#### Created by:
* David Guido
* Pierce Findlay
* Kayla Nguyen

#### CPSC 362, M/W: 11:00am-12:50pm <br> Fall 2019 
<br>

--- 

<br>

 ## Table of contents
  * [Overview](#overview)
  * [Design](#design)
  * [Development](#development)
  * [Resources](#resources)
  * [Diagrams](#diagrams)

<br>

***

<br>
<br>

# Overview
### Allows CSUF student users to:
1. Access the application using CSUF domain credentials
2. Create student or organization account using the following:
    * Username
    * PW
    * E-mail
    * First name, Last name
    * Major
    * CWID
3. Log-in using a previously created student or organization account
4. Create event:
    * Student Pick-Up Group 
    	* Study group
    	* Meet location
<br> <t> ie.   Car-pool parking location, club giveaways
    * Organization Event
    	* i.e. Blood drive, New faculty location, Weekly club meetings

5. Search for clubs & organization events
6. Maintain a student or organization profile 
7. Send or receive notifications corresponding to subscribed content with the ability to turn on/off in settings
<br> <t> ie.   If a student wishes to receive new information regarding a club or organization on campus, they can simply select ‘subscribe’ on the top right portion of any club-profile to start receiving notifications.

<br>

***

<br>
<br>

# Design

#### [AdobeXD Wireframe Link](https://xd.adobe.com/spec/25829805-09c1-433d-7d73-c29368a3b5de-53b3/)

<br>

***

<br>
<br>

# Development

### &nbsp;&nbsp;&nbsp;&nbsp;**Current State**
<img src="https://github.com/dguido1/friend-finder/blob/master/friend-finder/demoGIFS/log-in-still.png" alt="alt text" width="400px" height="auto">

<img src="https://github.com/dguido1/friend-finder/blob/master/friend-finder/demoGIFS/log-In00.gif" alt="alt text" width="400px" height="auto">

<img src="https://github.com/dguido1/friend-finder/blob/master/friend-finder/demoGIFS/log-In01.gif" alt="alt text" width="400px" height="auto">


## Custom Views (SwiftUI)

### &nbsp;&nbsp;&nbsp;&nbsp;**Event Item Button**
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img src="https://github.com/dguido1/friend-finder/blob/master/friend-finder/images/view-examples/EventItemButton.png" alt="alt text" width="400px" height="auto">

```swift
struct EventItemButton : View
{
    var iconColor : Color
    var eventIcon : String
    var nameText : String
    var dateText : String
    var likesText : String

    var body : some View
    {
                // EventItemButton parent container
        return  Button(action:
                {})
                {
                    HStack
                    {
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                             .fill(iconColor)
                            .frame(width: 30, height: 30).overlay(Image(systemName: eventIcon).font(.footnote).foregroundColor(Color.white))
                        
                        VStack
                        {
                            Text(nameText).font(.subheadline).foregroundColor(Color.black).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).aspectRatio(contentMode: .fill)
                            Text(dateText).font(.subheadline).foregroundColor(Color.gray).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        }
                        
                        Text (likesText).font(.subheadline).foregroundColor(Color.gray)
                        
                    // EventItemButton parent container formatting
                    }.frame(minWidth: 0, maxWidth: 350, minHeight: 0, maxHeight: 45, alignment: Alignment.leading)
                }
    }
}
```

<br>

### &nbsp;&nbsp;&nbsp;&nbsp;**Event Item Card**
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img src="https://github.com/dguido1/friend-finder/blob/master/friend-finder/images/view-examples/EventItemCard.png" alt="alt text" width="250px" height="auto">

```swift
struct EventItemCard : View
{
    var cardImage : String
    var dayOfWeek : String
    var eventName : String
    var organizationName : String
    
    var body : some View
    {
                // EventItemCard parent container
        return  VStack
                {
                    // ScrollView element texts
                    VStack(alignment: .leading)
                    {
                        Text(dayOfWeek).font(.callout).fontWeight(.heavy).foregroundColor(Color.blue)
                        
                            Text(eventName).font(.title).foregroundColor(Color.black)
                        Text(organizationName).font(.subheadline).fontWeight(.medium).foregroundColor(.gray)
                        
                    // ScrollView element texts formatting
                    }.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    // ScrollView button (image, mask, shadow)
                    HStack
                    {
                        Button (action:{
                        }){
                            Image(cardImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .cornerRadius(10)
                                .shadow(radius: 10)
                        }.buttonStyle(PlainButtonStyle())
                        
                        // Right arrow image
                        Image(systemName: "arrow.right").font(.headline).foregroundColor(.gray).frame(minHeight: 0, maxHeight: .infinity)
                    }
                
                // EventItemCard parent container formatting
                }.frame(minHeight: 0, maxHeight: 276)
    }
}
```

<br>

### &nbsp;&nbsp;&nbsp;&nbsp;**Notification Item**
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img src="https://github.com/dguido1/friend-finder/blob/master/friend-finder/images/view-examples/NotificationItem.png" alt="alt text" width="300px" height="auto">

```swift
struct NotificationItem : View
{
    var icon : String
    var message : String
    
    var body : some View
    {
                // Notification parent container
        return  HStack
                {
                    Image(systemName: icon).font(.subheadline).frame(minWidth: 30, maxWidth: 30, minHeight: 30, maxHeight: 30)
                    
                    Text(message).font(.subheadline)
                    
                // Notification parent container formatting
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 20, alignment: Alignment.leading)
    }
}
```

<br>

### &nbsp;&nbsp;&nbsp;&nbsp;**Profile Info**
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img src="https://github.com/dguido1/friend-finder/blob/master/friend-finder/images/view-examples/ProfileInfo.png" alt="alt text" width="350px" height="auto">

```swift
struct ProfileInfo : View
{
    var profilePicture : String
    var studentName : String
    var studentCity : String
    
    var body : some View
    {
               // ProfileInfo parent container
        return HStack
               {
                    ZStack
                    {
                        
                        // Profile image overlay
                        Image("ProfilePicOverlay01").resizable().aspectRatio(contentMode: .fit).shadow(radius: 40).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)

                        // Profile image
                        Image(profilePicture).resizable().aspectRatio(contentMode: .fit).overlay(RoundedRectangle(cornerRadius: 100).stroke(Color.blue, lineWidth: 15)).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity).aspectRatio(contentMode: .fit).frame(minHeight: 0, maxHeight: 100).cornerRadius(100).shadow(radius: 40)
                        
                    }.frame(minWidth: 0, maxWidth: 150, minHeight: 0, maxHeight: 175)
            
                    // Horizontal spacing
                    Text("   ")
                    
                    // Profile title texts vertical stack
                    VStack
                    {
                        Text (studentName).font(.title).fontWeight(.bold).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
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
```

---

<br>

## Database

### Notes:

1. Created Google Firebase relational-database

   * Project Settings:
      * Project name: **friend-finder**
      * Project ID: **friend-finder-csuf**
      * Google Cloud Platform resource location: **us-west2**
      * Web API Key: **AIzaSyCRB5UJgWUdkNsBF0azsSSMoOHiU6F6qVo**
      * Public-facing name: **friend-finder-csuf**
      * Google Account & Support email: **davidguido@litlabproductions.com**
 
    Note: Currently in test mode, not production<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Basically universal access, less secure but easier to test<br><br>
              
 
2. Added rules to dashboard compiler
      * Allows user access to only their own data, providing minimum security while testing

        ```
        {
          "rules": {
            "$uid": {
              ".write": "$uid === auth.uid",
              ".read": "$uid === auth.uid"
           }
         }
        }
        ```
        
<br>
 
 
3. Added Firebase to iOS Application
      * Adds Firebase libraries to project so we can access them
      * Contains endpoint and configuration data

   Steps:
     1. Registered App using **Bundle ID:** ***com.csuf.friend-finder***
     2. Download / import ***plist*** file
     3. Add Firebase SDK:
        1. Install [Cocoapods](https://guides.cocoapods.org/using/getting-started.html) (Provides a standard format for managing external libraries)
            * Provides a standard format for managing external libraries
        
            ```console
            sudo gem install cocoapods
            ```

        2. Open project folder in terminal, then create pod file using:
        
            ```console
            pod init
            ```
        
        3. Open file in text editor and add this script: 
            
            ```
            pod 'Firebase'
            pod 'Firebase/Auth'
            pod 'Firebase/Analytics'
            pod 'Firebase/Database'
            ``` 
            
        4. From now on,<br>&nbsp;&nbsp;&nbsp;Open: ```friend-finder.xcworkspace```<br>&nbsp;&nbsp;&nbsp;Instead of normal xCode project: ```friend-finder.xcodeproj```

        5. Added the following initialization code to ```AppDelegate.swift```
        
           ```swift
            import Firebase
           ```
           
           ```swift
              func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:
                  [UIApplicationLaunchOptionsKey: Any]?) -> Bool 
                  {
                      FirebaseApp.configure()
                      return true
                  }
            ```
            


### 
<br>

***

<br>
<br>

# Resources

1.   [SwiftUI Docs (Apple)](https://developer.apple.com/documentation/swiftui)

2.   [FuckingSwiftUI](https://fuckingswiftui.com/) or it's [non-explicit mirror](https://goshdarnswiftui.com/)
     * Best examples of SwiftUI components. Site's really awesome.<br>&nbsp;&nbsp;&nbsp;i.e.<br><br>
       Text:

        ```Swift
        Text("Hello World")
        Text("Hello World").bold().italic().underline().lineLimit(2)
        Text("Hello ") + Text("World!").bold()
        Text("Hello\nWorld!").multilineTextAlignment(.center)
        ```
       Horizontal Stack:
        ```Swift
        HStack (alignment: .center, spacing: 20)
        {
           Text("Hello")
           Divider()
           Text("World")
        }
        ```
       Vertical Stack:  
        ```Swift
        VStack (alignment: .center, spacing: 20)
        {
            Text("Hello")
            Divider()
            Text("World")
        }
        ```
<br>

***

<br>
<br>

# Diagrams

### Use Case Diagram
![FriendFinderUseCase05](https://user-images.githubusercontent.com/47490318/67425305-98d78b00-f58c-11e9-9b72-4964dbd861bc.png)

### CRC Model 
![CRC Modeling](https://user-images.githubusercontent.com/37362662/67426302-aaba2d80-f58e-11e9-931a-0e43150f76eb.png)

### Activity Diagram 
![ActivityDiagram-362 -  Blank UML](https://user-images.githubusercontent.com/26395400/67429213-8cefc700-f594-11e9-8406-022de4daeebb.png)

### Database ER Diagram 
![Database ER Diagram Example (Crow's Foot)](https://user-images.githubusercontent.com/47490318/68322144-c0901e00-0077-11ea-9d84-b61cef44ffc4.png)

### State Diagram
![UML State Machine Diagram Example](https://user-images.githubusercontent.com/26395400/68331214-74e67000-0089-11ea-804d-793baa51190a.png)

### Sequence Diagram
![User Sequence Diagram](https://user-images.githubusercontent.com/26395400/68330478-32706380-0088-11ea-830a-838cfb08ad93.png)
