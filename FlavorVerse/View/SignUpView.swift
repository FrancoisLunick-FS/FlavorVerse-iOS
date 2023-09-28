//
//  SignUpView.swift
//  FlavorVerse
//
//  Created by Lunick Francois on 8/31/23.
//
//  Description: This file contains the sign-up view for the FlavorVerse app.
//  The sign-up view allows users to create a new account by providing a username, email address, and password.
//
//  You are welcome to use, modify, and distribute this code under the terms of the MIT license.
//  Please retain this header in all copies of the code.
//
//  Git Repository: https://github.com/FrancoisLunick-FS/FlavorVerse-iOS
//
//  Note: This view is part of the FlavorVerse app, which is designed for recipe exploration and cooking.
//

import SwiftUI

struct SignUpView: View {
    
    // MARK: - Properties
    @State private var showWelcome = false
    @State private var showLogin = false
    @EnvironmentObject var viewModel: RegistrationViewModel
    
    // MARK: - Body
    var body: some View {
        
        ZStack {
            VStack {
                HStack {
                    Text("Create")
                        .foregroundColor(.red)
                        .bold()
                        .font(.largeTitle)
                    Spacer()
                }
                .padding(.leading)
                HStack {
                    Text("Account")
                        .foregroundColor(.red)
                        .bold()
                        .font(.largeTitle)
                    Spacer()
                }
                .padding(.leading)
                Spacer()
                
                // Username Textfield
                HStack {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 24, height: 24)
                    TextField("Username", text: $viewModel.username)
                }
                .padding(20)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                .padding(.horizontal)
                
                // Email Textfield
                HStack {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 24, height: 24)
                    TextField("Email", text: $viewModel.email)
                    
                    
                }
                .padding(20)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                .padding(.horizontal)
                
                // Password SecureField
                HStack {
                    Image(systemName: "lock")
                        .resizable()
                        .frame(width: 24, height: 24)
                    SecureField("Password", text: $viewModel.password)
                }
                .padding(20)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                .padding(.horizontal)
                
                Spacer()
                
                // Terms and Conditions Text
                Text("By continuing you agree to our Terms and Conditions and Privacy")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                VStack {
                    // Create Account Button
                    Button {
                        
                        Task {
                            try await viewModel.createUser()
                        }
                        
                        withAnimation {
                            showWelcome.toggle()
                        }
                        
                    } label: {
                        Text("Create Account")
                            .foregroundColor(.white)
                            .font(.body)
                            .frame(maxWidth: 200)
                    }
                    .padding(.all)
                    .buttonStyle(.borderedProminent)
                    .tint(.red)
                    .fullScreenCover(isPresented: $viewModel.isRegistered) {
                        SignUpCompleteView()
                    }
                    
                    // Error message display
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                        .padding(.top, 10)
                }
                
                
                // Already have an account? Text and Login Button
                HStack {
                    Text("Already have an account?")
                        .foregroundColor(.red)
                    
                    Button {
                        withAnimation {
                            showLogin.toggle()
                        }
                        
                    } label: {
                        Text("Login")
                            .foregroundColor(.red)
                    }
                    .fullScreenCover(isPresented: $showLogin) {
                        LoginView()
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                }
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

