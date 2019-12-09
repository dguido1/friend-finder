    //
    //  AuthenticationHandlerView.swift
    //  friend-finder
    //
    //  Created by David Guido on 12/7/19.
    //  Copyright © 2019 CSUF. All rights reserved.
    //
    
    import SwiftUI
    
    struct AuthenticationHandlerView: View {
        @ObservedObject var session = FirebaseSession()
        
        @State var email: String = ""
        @State var password: String = ""
        
        @State private var showError = false
        
        @State private var showSignUp = false
        @State var signInSuccess = false
        
        var body: AnyView {
            if (signInSuccess) {
                return AnyView(NavBarStateView())
                //AnyView(NavBarStateView())
            }
            else if (!showSignUp) {
                return AnyView(signInView)
            }
            else {
                return AnyView(signUpView)
            }
        }
        
        var signInView: some View {
            
            ZStack {
                
                    CustomBackgroundView()
                    
                    VStack {
                        VStack {
                            VStack {
                                Image("FriendFinderLogoGreyscale").font(.subheadline).frame(minWidth: 100, maxWidth: 100, minHeight: 100, maxHeight: 100).padding(.bottom, 3)
                                
                                HStack {
                                    Text("Friend").tracking(3).font(Font.custom("Somatic-Rounded", size: 22.0)).font(.headline).fontWeight(.light).foregroundColor(Color.white).opacity(0.75).shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/).padding(.trailing, -0.2)
                                    
                                    Text("Finder").tracking(3).font(Font.custom("Somatic-Rounded", size: 22.0)).font(.headline).fontWeight(.light).foregroundColor(Color.white).opacity(0.75).shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/).padding(.leading, -0.2)
                                    
                                    Text("™").font(Font.custom("Somatic-Rounded", size: 15.0)).font(.headline).fontWeight(.light).foregroundColor(Color.white).opacity(0.5).shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/).padding(.leading, -7)
                                }.padding(.leading, 10).padding(.bottom, 10)
                                
                                Text("Sign In | CSUF").tracking(3).font(Font.custom("Somatic-Rounded", size: 15.0)).font(.headline).fontWeight(.light).foregroundColor(Color.white).opacity(0.75).shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/).padding(.bottom, 5)

                                VStack {
                                    Text(" ").padding(.bottom, 20).padding(.bottom, 20).opacity(85)
                                    
                                    CustomTextInputView()
                                    
                                    Rectangle().stroke(Color.white, lineWidth: 0.5)
                                        .frame(width: 275, height: 0.5).frame(alignment: .leading).opacity(0.75).padding(.bottom, 25)
                                    
                                    Text(" ").padding(.bottom, 5).opacity(85)
                                    
                                    CustomSecureView()

                                    Rectangle().stroke(Color.white, lineWidth: 0.5).frame(width: 275, height: 0.5).frame(alignment: .leading).opacity(0.75)
                                    
                                    Button (action: {
                                        self.signIn()
                                    }){
                                        Text("Sign-In")
                                    }.padding(.top, 10)
                                    
                                    Button (action: {
                                        self.devSignIn()
                                    }){
                                        Text("Development Sign-In")
                                    }.padding(.top, 10)
                                    
                                }.padding(.bottom, 150).foregroundColor(Color.white).opacity(0.8)
                                
                                Button(action: {
                                    self.toSignUp()
                                }) {
                                    Text("Don't have an account? Sign-up.").padding(.bottom, 30)
                                }
                                // Login button pressed
                                
                            }.foregroundColor(Color.white).opacity(0.7)
                        }.frame(minWidth: 275, maxWidth: 275, minHeight: 0, maxHeight:500, alignment: .bottom).foregroundColor(Color.white).padding(.top, 20)
                    }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottom).foregroundColor(Color.white)
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        }
        
        var signUpView: some View {
            ZStack {
                    CustomBackgroundView()
                    
                    VStack {
                        VStack {
                            VStack {
                                Image("FriendFinderLogoGreyscale").font(.subheadline).frame(minWidth: 100, maxWidth: 100, minHeight: 100, maxHeight: 100).padding(.bottom, 3)
                                
                                HStack {
                                    Text("Friend").tracking(3).font(Font.custom("Somatic-Rounded", size: 22.0)).font(.headline).fontWeight(.light).foregroundColor(Color.white).opacity(0.75).shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/).padding(.trailing, -0.2)
                                    
                                    Text("Finder").tracking(3).font(Font.custom("Somatic-Rounded", size: 22.0)).font(.headline).fontWeight(.light).foregroundColor(Color.white).opacity(0.75).shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/).padding(.leading, -0.2)
                                    
                                    Text("™").font(Font.custom("Somatic-Rounded", size: 15.0)).font(.headline).fontWeight(.light).foregroundColor(Color.white).opacity(0.5).shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/).padding(.leading, -7)
                                }.padding(.leading, 10).padding(.bottom, 10)
                                
                                Text("Sign Up | CSUF").tracking(3).font(Font.custom("Somatic-Rounded", size: 15.0)).font(.headline).fontWeight(.light).foregroundColor(Color.white).opacity(0.75).shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/).padding(.bottom, 30)

                                VStack {
                                    Text("Enter your Student Email").padding(.bottom, 30).padding(.top, 30).opacity(85)
                                    
                                    CustomTextInputView()

                                    Rectangle().stroke(Color.white, lineWidth: 0.5)
                                        .frame(width: 275, height: 0.5).frame(alignment: .leading).opacity(0.75).padding(.bottom, 25)
                                    
                                    Text("Enter a Password").padding(.bottom, 30).padding(.top, 30).opacity(85)
                                    
                                    CustomSecureView()

                                    Rectangle().stroke(Color.white, lineWidth: 0.5).frame(width: 275, height: 0.5).frame(alignment: .leading).opacity(0.75)
                                    
                                    Button (action: {
                                        self.signUp()
                                    }){
                                        Text("Sign-Up")
                                    }.padding(.top, 10)
                                    
                                }.padding(.bottom, 150).foregroundColor(Color.white).opacity(0.8)
                                
                                Button(action: {
                                    self.toSignIn()
                                }) {
                                    Text("Already have an account? Sign-in.").padding(.bottom, 30)
                                }
                                // Login button pressed
                                
                            }.foregroundColor(Color.white).opacity(0.7)
                        }.frame(minWidth: 275, maxWidth: 275, minHeight: 0, maxHeight:500, alignment: .bottom).foregroundColor(Color.white).padding(.top, 20)
                    }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottom).foregroundColor(Color.white)
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        }
        
        func signUp() {
            if (!email.isEmpty && !password.isEmpty)
            {
                session.signUp(email: email, password: password)
                {
                    (result, error) in
                    if error != nil {
                        print("Error")
                    } else {
                        self.signInSuccess = true
                    }
                }
            }
        }
        
        func signIn() {
            session.logIn(email: email, password: password)
            {
                (result, error) in
                if error != nil {
                    print("Error")
                }
                else {
                    self.signInSuccess = true
                }
            }
        }
        
        func devSignIn() {
            self.signInSuccess = true
        }
        
        func toSignUp() {
            showSignUp = true
        }
        
        func toSignIn() {
            showSignUp = false
        }
        
        func getUser() {
            session.listen()
        }
        
        func CustomTextInputView() -> some View
        {
            if (email.count > 0) {
                return VStack {
                            ZStack {
                                VStack {
                                    Text("").opacity(0.75).frame(alignment: .leading).frame(alignment: .leading).multilineTextAlignment(.leading)
                                }.frame(minWidth: 275, maxWidth: 275, minHeight: 0, maxHeight:500, alignment: .bottomLeading).foregroundColor(Color.white)
                                
                                TextField(email, text:$email).padding(.bottom, -5).foregroundColor(Color.white).frame(alignment: .leading).multilineTextAlignment(.leading)
                            }
                    }.frame(alignment: .leading).opacity(0.75)
            }
            
            return VStack {
                        ZStack {
                            VStack {
                                Text("E-mail").opacity(0.75).frame(alignment: .leading).frame(alignment: .leading).multilineTextAlignment(.leading)
                            }.frame(minWidth: 275, maxWidth: 275, minHeight: 0, maxHeight:500, alignment: .bottomLeading).foregroundColor(Color.white)
                            
                            TextField(email, text: $email).padding(.bottom, -5).foregroundColor(Color.white).frame(alignment: .leading).multilineTextAlignment(.leading)
                        }
                }.frame(alignment: .leading).opacity(0.75)
        }

        func CustomSecureView() -> some View
        {
            if (password.count > 0) {
                return VStack{
                            ZStack{
                                VStack{
                                    Text("").opacity(0.75).frame(alignment: .leading).frame(alignment: .leading).multilineTextAlignment(.leading)
                                }.frame(minWidth: 275, maxWidth: 275, minHeight: 0, maxHeight:500, alignment: .bottomLeading).foregroundColor(Color.white)
                                
                                SecureField(password, text: $password).padding(.bottom, -5).foregroundColor(Color.white).frame(alignment: .leading).multilineTextAlignment(.leading)
                            }
                    }.frame(alignment: .leading).opacity(0.75)
            }
            
            return VStack {
                        ZStack {
                            VStack {
                                Text("Password").opacity(0.75).frame(alignment: .leading).frame(alignment: .leading).multilineTextAlignment(.leading)
                            }.frame(minWidth: 275, maxWidth: 275, minHeight: 0, maxHeight:500, alignment: .bottomLeading).foregroundColor(Color.white)
                            
                            SecureField(password, text: $password).padding(.bottom, -5).foregroundColor(Color.white).frame(alignment: .leading).multilineTextAlignment(.leading)
                        }
                }.frame(alignment: .leading).opacity(0.75)
        }
    }
    
    func CustomBackgroundView() -> some View
    {
        return VStack {
            ZStack{
                    Image("CSUFSplashScreen").font(.subheadline).frame(minHeight: 0, maxHeight: .infinity).contrast(/*@START_MENU_TOKEN@*/2.0/*@END_MENU_TOKEN@*/).blur(radius: /*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center).edgesIgnoringSafeArea([.all])
                    Image("BGOverlay00").font(.subheadline).frame(minHeight: 0, maxHeight: .infinity).opacity(0.75).frame(minHeight: 0, maxHeight: .infinity, alignment: .center).edgesIgnoringSafeArea([.all])
                    Image("GradientBG").font(.subheadline).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity).opacity(0.5).frame(minHeight: 0, maxHeight: .infinity, alignment: .center).edgesIgnoringSafeArea([.all])
                    Image("BGOverlay00").font(.subheadline).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity).opacity(0.8).frame(minHeight: 0, maxHeight: .infinity, alignment: .center).edgesIgnoringSafeArea([.all])
                    Image("GradientBG").font(.subheadline).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity).opacity(0.5).frame(minHeight: 0, maxHeight: .infinity, alignment: .center).edgesIgnoringSafeArea([.all])
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight:.infinity).aspectRatio(contentMode: .fit)
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight:.infinity).aspectRatio(contentMode: .fit)
    }
    
    struct AuthenticationHandlerView_Previews: PreviewProvider {
        static var previews: some View {
            AuthenticationHandlerView()
        }
    }
