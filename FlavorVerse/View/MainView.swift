//
//  MainView.swift
//  FlavorVerse
//
//  Created by Lunick Francois on 8/31/23.
//
//  Description: This file contains the main view for the FlavorVerse app.
//  The main view serves as the entry point for the app, allowing users to either log in or sign up.
//
//  You are welcome to use, modify, and distribute this code under the terms of the MIT license.
//  Please retain this header in all copies of the code.
//
//  Note: This view is part of the FlavorVerse app, which is designed for recipe exploration and cooking.
//

import SwiftUI

struct MainView: View {
    @State private var showLogin = false
    @State private var showSignUp = false
    @State private var amount = 0.5
    
    var body: some View {
        ZStack {
            Image("loginbackground")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Text("Welcome!")
                    .font(.title)
                    .foregroundColor(.white)
                    .bold()
                
                Spacer()
                
                Button {
                        withAnimation {
                            showLogin.toggle()
                        }

                } label: {
                    Text("Login")
                        .foregroundColor(.white)
                        .font(.title)
                        .frame(maxWidth: .infinity)
                }
                .padding(.all)
                .buttonStyle(.borderedProminent)
                .tint(.red)
                .sheet(isPresented: $showLogin) {
                    LoginView()
                        .presentationDetents([.height(400), .large, .large])
                        .presentationDragIndicator(.hidden)
                }
                
                Button {
                    withAnimation {
                        showSignUp.toggle()
                    }
                    
                } label: {
                    Text("Sign Up")
                        .foregroundColor(.red)
                        .font(.title)
                        .frame(maxWidth: .infinity)
                }
                .padding([.leading, .bottom, .trailing])
                .buttonStyle(.borderedProminent)
                .tint(.white)
                .sheet(isPresented: $showSignUp) {
                    SignUpView()
                }
                
            }
        }.zIndex(1)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
