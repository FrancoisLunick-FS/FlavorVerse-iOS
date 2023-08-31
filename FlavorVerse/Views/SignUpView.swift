//
//  SignUpView.swift
//  FlavorVerse
//
//  Created by Lunick Francois on 8/31/23.
//

import SwiftUI

struct SignUpView: View {
    @State private var emailAddress = ""
    @State private var username = ""
    @State private var password = ""
    @State private var showWelcome = false
    @State private var showLogin = false
    
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
                
                HStack {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 24, height: 24)
                    TextField("Username", text: $username)
                }
                .padding(20)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                .padding(.horizontal)
                
                HStack {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 24, height: 24)
                    TextField("Email", text: $emailAddress)
                        
                        
                }
                .padding(20)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                .padding(.horizontal)
                
                HStack {
                    Image(systemName: "lock")
                        .resizable()
                        .frame(width: 24, height: 24)
                    SecureField("Password", text: $password)
                }
                .padding(20)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                .padding(.horizontal)
                
                Spacer()
                
                Text("By continuing you agree to our Terms and Conditions and Privacy")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                
                Button {
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
                .sheet(isPresented: $showWelcome) {
                    LoginView()
                        .presentationDetents([.height(400), .large, .large])
                }
                
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
                    .sheet(isPresented: $showLogin) {
                        LoginView()
                    }
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

