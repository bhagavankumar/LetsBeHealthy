//
//  LetsBeHealthyApp.swift
//  LetsBeHealthy
//
//  Created by Bhagavan Kumar V on 2025-01-09.
//

import SwiftUI
import GoogleSignIn

@main
struct LetsBeHealthyApp: App {
    @State private var isLoggedIn: Bool = false
    @State var user:User?
    var body: some Scene {
        WindowGroup {
            ContentView(user: self.$user)
                .onOpenURL{url in GIDSignIn.sharedInstance.handle(url)}
                //once signed in through app, do not log out after closing app
                .onAppear {
                    GIDSignIn.sharedInstance.restorePreviousSignIn{ user, error in
                        if  let user{
                            self.user = .init(name: user.profile?.name ?? "")
                            LoginView(isLoggedIn: $isLoggedIn, user: $user)
                        }
                        
                    }
                }
        }
    }
}
struct User{
    var name: String
}


