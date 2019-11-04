&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="https://github.com/dguido1/friend-finder/blob/master/friend-finder/images/logos/FriendFinderLogoColor.svg" alt="alt text" width="100x" height="auto">

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

#### Event Item Card
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="https://gyazo.com/aa46b3b231a908c65aeac00cfd57309a" alt="alt text" width="100x" height="auto">



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


## Diagrams

### Use Case Diagram
![FriendFinderUseCase05](https://user-images.githubusercontent.com/47490318/67425305-98d78b00-f58c-11e9-9b72-4964dbd861bc.png)

### CRC Model 
![CRC Modeling](https://user-images.githubusercontent.com/37362662/67426302-aaba2d80-f58e-11e9-931a-0e43150f76eb.png)

### Activity Diagram 
![ActivityDiagram-362 -  Blank UML](https://user-images.githubusercontent.com/26395400/67429213-8cefc700-f594-11e9-8406-022de4daeebb.png)



---

## Resources
