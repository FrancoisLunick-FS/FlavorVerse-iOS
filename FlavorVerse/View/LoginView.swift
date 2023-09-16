//
//  LoginView.swift
//  FlavorVerse
//
//  Created by Lunick Francois on 8/31/23.
//

import SwiftUI

struct LoginView: View {
    @State private var emailAddress = ""
    @State private var password = ""
    @State private var showWelcome = false
    @State private var showSignUp = false
    
    var body: some View {
        ZStack {
            
            VStack(alignment: .center) {
                
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
                
                HStack {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 24, height: 24)
                    TextField("Username", text: $emailAddress)
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
                
                Button {
                    
                } label: {
                    Text("Forgot Password?")
                        .foregroundColor(.gray)
                        .padding(.leading, 215.0)
                    
                }
                
                Button {
                    withAnimation {
                        showWelcome.toggle()
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
                .sheet(isPresented: $showWelcome) {
                    LoginView()
                        .presentationDetents([.height(400), .large, .large])
                    
                    
                }
                
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

