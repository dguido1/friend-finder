    //
    //  ContentView.swift
    //
    //  Friend Finder, CPSC 362, M/W: 11:00am-12:50pm
    //  CSUF Fall 2019
    //
    //  Created by David Guido, Pierce Findlay & Kayla Nguyen on 11/01/2019.
    
    import SwiftUI
    
    struct ContentView: View
    {
        init()
        {
            UITabBar.appearance().backgroundColor = UIColor.white
        }
        
        var body: some View
        {
            return AuthenticationHandler()
        }
    }
    
    /*
        Handles:
            1. Sign up
            2. Sign in
            3. Authentication
                --> a. Home Page
                    b. Error
     */
    struct AuthenticationHandler: View
    {
        @ObservedObject var session = FirebaseSession()

        @State var email: String = ""
        @State var password: String = ""
        
        @State private var showError = false
        
        @State private var showSignUp = false
        @State var signInSuccess = false

        var body: AnyView
        {
            //if (signInSuccess)
          //  {
                return AnyView(NewPickupEventView())
                    //AnyView(NavBarStateView())
         /*   }
            else if (!showSignUp)
            {
                return AnyView(signInView)
            }
            else
            {
                return AnyView(signUpView)
            }
             */
        }
        
        var signInView: some View
        {
            VStack(spacing: 20)
            {
                Text("Sign In")
                
                TextField("Email", text: $email)
                
                SecureField("Password", text: $password)
                
                Button(action: signIn)
                {
                    Text("Sign In")
                }.padding()
                
                Button(action: toSignUp)
                {
                    Text("Sign Up")
                }.padding(5)
            }.padding(5)
        }
        
        var signUpView: some View
        {
            Group {
                VStack {
                    HStack {
                        Text("Email")
                        TextField("Enter Email Address", text: $email)
                    }
                    .padding()
                    
                    HStack {
                        Text("Password")
                        TextField("Enter Password", text: $password)
                    }
                    .padding()
                    
                    Button(action: signUp) {
                        Text("Sign Up")
                    }
                    Button(action: toSignIn) {
                        Text(" Already have an account? Sign In.")
                    }.padding(5)
                }
            }
            .padding()
        }
        
        func signUp()
        {
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
        
        func signIn()
        {
            session.logIn(email: email, password: password)
            {
                (result, error) in
                    if error != nil
                    {
                        print("Error")
                    }
                    else
                    {
                        self.signInSuccess = true
                    }
            }
        }
        
        func toSignUp(){
            showSignUp = true
        }
        
        func toSignIn(){
            showSignUp = false
        }
        
        func getUser() {
            session.listen()
        }
    }
    
    struct NavBarStateView: View
    {
        @State public var selected: Double = 0.0
        
        var body: some View
        {
            return      TabView(selection: $selected)
            {
                // Tab 00
                DiscoverView().tabItem({
                    Image(systemName: Constants.TabBarImageName.tabBar0)
                        .font(.title)
                    Text("\(Constants.TabBarText.tabBar0)")
                }).tag(0)
                
                // Tab 01
                CreateView().tabItem({
                    Image(systemName: Constants.TabBarImageName.tabBar1)
                        .font(.title)
                    Text("\(Constants.TabBarText.tabBar1)")
                }).tag(1)
                
                // Tab 02
                SearchView().tabItem({
                    Image(systemName: Constants.TabBarImageName.tabBar2)
                        .font(.title)
                    Text("\(Constants.TabBarText.tabBar2)")
                }).tag(2)
                
                // Tab 03
                ProfileView().tabItem({
                    Image(systemName: Constants.TabBarImageName.tabBar3)
                        .font(.title)
                    Text("\(Constants.TabBarText.tabBar3)")
                }).tag(3)
            }.accentColor(Color.blue)
        }
    }
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
