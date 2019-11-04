&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="https://github.com/dguido1/friend-finder/blob/master/friend-finder/images/logos/FriendFinderLogoColor.svg" alt="alt text" width="100px" height="auto">

# Friend Finder
## It's time, link-up with CSUF peers now <br>

### a Native iOS application built with SwiftUI
#### Created by:
* David Guido
* Pierce Findlay
* Kayla Nguyen

#### CPSC 362, M/W: 11:00am-12:50pm <br> Fall 2019 
--- 
<br>

 ## Table of contents
  * [Overview](#overview)
  * [Design](#design)
  * [Development](#development)
  * [Diagrams](#diagrams)
  * [Resources](#resources)
<br>

***



## Overview
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
    	* Blood drive
    	* New faculty location
    	* Weekly club meetings

5. Search for clubs & organization events
6. Maintain a student or organization profile 
7. Send or receive notifications corresponding to subscribed content with the ability to turn on/off in settings
<br> <t> ie.   If a student wishes to receive new information regarding a club or organization on campus, they can simply select ‘subscribe’ on the top right portion of any club-profile to start receiving notifications.


---

## Design

#### [AdobeXD Wireframe Link](https://xd.adobe.com/spec/25829805-09c1-433d-7d73-c29368a3b5de-53b3/)

---

## Development

### Custom Views

#### Event Item Button
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


## Diagrams

### Use Case Diagram
![FriendFinderUseCase05](https://user-images.githubusercontent.com/47490318/67425305-98d78b00-f58c-11e9-9b72-4964dbd861bc.png)

### CRC Model 
![CRC Modeling](https://user-images.githubusercontent.com/37362662/67426302-aaba2d80-f58e-11e9-931a-0e43150f76eb.png)

### Activity Diagram 
![ActivityDiagram-362 -  Blank UML](https://user-images.githubusercontent.com/26395400/67429213-8cefc700-f594-11e9-8406-022de4daeebb.png)



---

## Resources
