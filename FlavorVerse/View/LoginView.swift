//
//  LoginView.swift
//  FlavorVerse
//
//  Created by Lunick Francois on 8/31/23.
//
//  Description: This file contains the login view for the FlavorVerse app.
//  The login view allows users to sign in, enter their email address and password, and access their account.
//
//  You are welcome to use, modify, and distribute this code under the terms of the MIT license.
//  Please retain this header in all copies of the code.
//
//  Git Repository: https://github.com/FrancoisLunick-FS/FlavorVerse-iOS
//
//  Note: This view is part of the FlavorVerse app, which is designed for recipe exploration and cooking.
//

import SwiftUI

struct LoginView: View {
    // MARK: - Properties
    
    // State variables to store user input
    @State private var emailAddress = ""
    @State private var password = ""
    @State private var showWelcome = false
    @State private var showSignUp = false
    @State private var showHome = false
    
    @EnvironmentObject var viewModel: LoginViewModel
    
    // MARK: - Body
    var body: some View {
        ZStack {
            
            VStack(alignment: .center) {
                // Title and Sign Up button
                HStack(spacing: 200) {
                    Text("Login")
                        .font(.title)
                        .bold()
                    
                    Button {
                        withAnimation {
                            showSignUp.toggle()
                        }
                        
                    } label: {
                        Text("Sign Up")
                            .foregroundColor(.black)
                    }
                    .fullScreenCover(isPresented: $showSignUp) {
                        SignUpView()
                    }
                    
                }
                // Username input field
                HStack {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 24, height: 24)
                    TextField("Username", text: $viewModel.email)
                }
                .padding(20)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                .padding(.horizontal)
                // Password input field
                HStack {
                    Image(systemName: "lock")
                        .resizable()
                        .frame(width: 24, height: 24)
                    SecureField("Password", text: $viewModel.password)
                }
                .padding(20)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                .padding(.horizontal)
                // Forgot Password button
                Button {
                    
                } label: {
                    Text("Forgot Password?")
                        .foregroundColor(.gray)
                        .padding(.leading, 215.0)
                }
                // Login button
                Button {
                    
                    Task {
                        try await viewModel.loginUser()
                    }
                    
                } label: {
                    Text("Login")
                        .foregroundColor(.white)
                        .font(.title)
                        .frame(maxWidth: 200)
                }
                .padding(.all)
                .buttonStyle(.borderedProminent)
                .tint(.red)
                .fullScreenCover(isPresented: $viewModel.isAuthenticated) {
                    HomeView()
                }
                
                // Error message display
                Text(viewModel.errorMessage)
                    .foregroundColor(.red)
                    .padding(.top, 10) // Add some spacing from the login button
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

