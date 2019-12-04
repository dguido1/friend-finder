//
//  LandingView.swift
//  friend-finder
//
//  Created by David Guido on 11/5/19.
//  Copyright © 2019 CSUF. All rights reserved.
//

import SwiftUI
/*
struct LandingView: View
{
        //MARK: Properties
        @State var email: String = ""
        @State var password: String = ""
        
        @EnvironmentObject var session: FirebaseSession
        
        var body: some View {
            VStack(spacing: 20) {
                Text("Sign In")
                //NavigationLink(destination: SignUpView())

                TextField("Email", text: $email)
                
                SecureField("Password", text: $password)
                Button(action: logIn) {
                    Text("Sign In")
                }.padding()

              //  }
            }
        .padding()
        }
        
        //MARK: Functions
        func logIn() {
            session.logIn(email: email, password: password) { (result, error) in
                if error != nil {
                    print("Error")
                } else {
                    self.email = ""
                    self.password = ""
                }
            }
        }
    }

     
    @State public var username: String = ""
    @State public var password: String = ""
    @State public var signUp: String = "Don't have an account? Sign-up."
    
    @EnvironmentObject var stateCycle: StateCycle

    
    var body: some View
    {
        ZStack
        {
            CustomBackgroundView()
            
            
            VStack {
                VStack
                    {
                            VStack
                            {
                                    
                                Image("FriendFinderLogoGreyscale").font(.subheadline).frame(minWidth: 100, maxWidth: 100, minHeight: 100, maxHeight: 100).padding(.bottom, 3)
                                    
                                HStack
                                {
                                    Text("Friend").tracking(3).font(Font.custom("Somatic-Rounded", size: 22.0)).font(.headline).fontWeight(.light).foregroundColor(Color.white).opacity(0.75).shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/).padding(.trailing, -0.2)
                                    
                                    Text("Finder").tracking(3).font(Font.custom("Somatic-Rounded", size: 22.0)).font(.headline).fontWeight(.light).foregroundColor(Color.white).opacity(0.75).shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/).padding(.leading, -0.2)
                                    
                                    Text("™").font(Font.custom("Somatic-Rounded", size: 15.0)).font(.headline).fontWeight(.light).foregroundColor(Color.white).opacity(0.5).shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/).padding(.leading, -7)
                                }.padding(.leading, 10).padding(.bottom, 30)
                                    
                                VStack
                                {
                                    CustomTextInputView()
                                        
                                    Rectangle().stroke(Color.white, lineWidth: 0.5)
                                        .frame(width: 275, height: 0.5).frame(alignment: .leading).opacity(0.75).padding(.bottom, 25)

                                    CustomSecureView()
                                            
                                    Rectangle().stroke(Color.white, lineWidth: 0.5).frame(width: 275, height: 0.5).frame(alignment: .leading).opacity(0.75)
                                    
                                    Button (action: {
                                        self.ToggleLoginState()
                                    }){
                                        Text("Login")
                                    }.padding(.top, 10)
                                    
                                }.padding(.bottom, 150).foregroundColor(Color.white).opacity(0.8)
                                
                                Button(action: {
                                }) {
                                    Text("Don't have an account? Sign-up.")
                                }
                                    // Login button pressed


                                    
                                }.foregroundColor(Color.white).opacity(0.7)
                }.frame(minWidth: 275, maxWidth: 275, minHeight: 0, maxHeight:500, alignment: .top).foregroundColor(Color.white).padding(.top, 20)
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottom).foregroundColor(Color.white)
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        }
    
    func ToggleLoginState()
    {
        self.stateCycle.loginSucess = true
    }
    
    func CustomBackgroundView() -> some View
    {
        return VStack {
            ZStack
                   {
                       Image("CSUFSplashScreen").font(.subheadline).frame(minHeight: 0, maxHeight: .infinity).contrast(/*@START_MENU_TOKEN@*/2.0/*@END_MENU_TOKEN@*/).blur(radius: /*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center).edgesIgnoringSafeArea([.all])
                                
                       Image("BGOverlay00").font(.subheadline).frame(minHeight: 0, maxHeight: .infinity).opacity(0.75).frame(minHeight: 0, maxHeight: .infinity, alignment: .center).edgesIgnoringSafeArea([.all])
                       Image("GradientBG").font(.subheadline).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity).opacity(0.5).frame(minHeight: 0, maxHeight: .infinity, alignment: .center).edgesIgnoringSafeArea([.all])
                       Image("BGOverlay00").font(.subheadline).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity).opacity(0.8).frame(minHeight: 0, maxHeight: .infinity, alignment: .center).edgesIgnoringSafeArea([.all])
                       Image("GradientBG").font(.subheadline).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity).opacity(0.5).frame(minHeight: 0, maxHeight: .infinity, alignment: .center).edgesIgnoringSafeArea([.all])
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight:.infinity).aspectRatio(contentMode: .fit)
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight:.infinity).aspectRatio(contentMode: .fit)
    }

    func CustomSecureView() -> some View
    {
        if (password.count > 0)
        {
            return VStack
                   {

                        ZStack
                        {
                            VStack
                            {
                                Text("").opacity(0.75).frame(alignment: .leading).frame(alignment: .leading).multilineTextAlignment(.leading)
                            }.frame(minWidth: 275, maxWidth: 275, minHeight: 0, maxHeight:500, alignment: .bottomLeading).foregroundColor(Color.white)
                            
                            SecureField(password, text: $password).padding(.bottom, -5).foregroundColor(Color.white).frame(alignment: .leading).multilineTextAlignment(.leading)
                        }
                
                }.frame(alignment: .leading).opacity(0.75)
                
        }
        
        
        return VStack
               {

                    ZStack
                    {
                        VStack
                        {
                            Text("Password").opacity(0.75).frame(alignment: .leading).frame(alignment: .leading).multilineTextAlignment(.leading)
                        }.frame(minWidth: 275, maxWidth: 275, minHeight: 0, maxHeight:500, alignment: .bottomLeading).foregroundColor(Color.white)
                        
                        SecureField(password, text: $password).padding(.bottom, -5).foregroundColor(Color.white).frame(alignment: .leading).multilineTextAlignment(.leading)
                    }
            
            }.frame(alignment: .leading).opacity(0.75)
    }

    
    func CustomTextInputView() -> some View
    {
        if (username.count > 0)
        {
            return VStack
                   {
                        ZStack
                        {
                            VStack
                            {
                                Text("").opacity(0.75).frame(alignment: .leading).frame(alignment: .leading).multilineTextAlignment(.leading)
                            }.frame(minWidth: 275, maxWidth: 275, minHeight: 0, maxHeight:500, alignment: .bottomLeading).foregroundColor(Color.white)
                            
                            TextField(username, text:$username).padding(.bottom, -5).foregroundColor(Color.white).frame(alignment: .leading).multilineTextAlignment(.leading)
                        }

                
                }.frame(alignment: .leading).opacity(0.75)
                
        }
        
        
        return VStack
               {
                    ZStack
                    {
                        VStack
                        {
                            Text("Username").opacity(0.75).frame(alignment: .leading).frame(alignment: .leading).multilineTextAlignment(.leading)
                        }.frame(minWidth: 275, maxWidth: 275, minHeight: 0, maxHeight:500, alignment: .bottomLeading).foregroundColor(Color.white)
                        
                        TextField(username, text: $username).padding(.bottom, -5).foregroundColor(Color.white).frame(alignment: .leading).multilineTextAlignment(.leading)
                    }
            }.frame(alignment: .leading).opacity(0.75)
    }



}
 */
//s//truct LandingView_Previews: PreviewProvider
//{
  //  static var previews: some View
        
 //   {
    //    LandingView()
  //  }

//}
