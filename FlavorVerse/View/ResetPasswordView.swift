//
//  ResetPasswordView.swift
//  FlavorVerse
//
//  Created by Lunick Francois on 9/28/23.
//
//  Description: This file contains the ResetPasswordView struct, which is responsible for
//  displaying the interface for resetting a user's password in the FlavorVerse app.
//
//  You are welcome to use, modify, and distribute this code under the terms of the MIT license.
//  Please retain this header in all copies of the code.
//
//  Git Repository: https://github.com/FrancoisLunick-FS/FlavorVerse-iOS
//
//  Note: ResetPasswordView is part of the FlavorVerse app, facilitating the password reset process.
//

import SwiftUI

struct ResetPasswordView: View {
    
    // MARK: - Properties
    
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var showLogin = false
    
    // MARK: - Body
    var body: some View {
        
        ZStack {
            
            VStack(alignment: .center) {
                // Title text field
                HStack(spacing: 200) {
                    Text("Reset Password")
                        .font(.title)
                        .bold()
                }
                
                Text("Set the new password for your account so you can login and access all the recipes")
                    .multilineTextAlignment(.center)
                    .padding(.all)
                
                // Password input field
                HStack {
                    Image(systemName: "lock")
                        .resizable()
                        .frame(width: 24, height: 24)
                    TextField("Password", text: $password)
                }
                .padding(20)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                .padding(.horizontal)
                
                // Confirm password input field
                HStack {
                    Image(systemName: "lock")
                        .resizable()
                        .frame(width: 24, height: 24)
                    TextField("Confirm Password", text: $confirmPassword)
                }
                .padding(20)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                .padding(.horizontal)
                
                // Reset password button
                Button {
                    withAnimation {
                        showLogin.toggle()
                    }
                } label: {
                    Text("Reset Password")
                        .foregroundColor(.white)
                        .font(.body)
                        .frame(maxWidth: 200)
                }
                .padding(.all)
                .buttonStyle(.borderedProminent)
                .tint(.red)
                .sheet(isPresented: $showLogin) {
                    LoginView()
                        .presentationDetents([.height(400), .large, .large])
                        .presentationDragIndicator(.hidden)
                }
            }
        }
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
