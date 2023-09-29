//
//  ForgotPasswordView.swift
//  FlavorVerse
//
//  Created by Lunick Francois on 9/28/23.
//
//  Description: This file contains the ForgotPasswordView struct, which is responsible for
//  displaying the interface for initiating the password reset process by entering the user's email.
//
//  You are welcome to use, modify, and distribute this code under the terms of the MIT license.
//  Please retain this header in all copies of the code.
//
//  Git Repository: https://github.com/FrancoisLunick-FS/FlavorVerse-iOS
//
//  Note: ForgotPasswordView is part of the FlavorVerse app, facilitating the initiation of the password reset process.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    // MARK: - Properties
    
    @State private var email = ""
    @State private var showPasswordReset = false
    
    // MARK: - Body
    var body: some View {
        
        ZStack {
            
            VStack(alignment: .center) {
                // Title text field
                HStack(spacing: 200) {
                    Text("Forgot Password")
                        .font(.title)
                        .bold()
                }
                
                Text("Enter your email to reset password.")
                
                // Email input field
                HStack {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 24, height: 24)
                    TextField("Email", text: $email)
                }
                .padding(20)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                .padding(.horizontal)
                
                // MARK: - Body
                Button {
                    withAnimation {
                        showPasswordReset.toggle()
                    }
                } label: {
                    Text("Continue")
                        .foregroundColor(.white)
                        .font(.body)
                        .frame(maxWidth: 200)
                }
                .padding(.all)
                .buttonStyle(.borderedProminent)
                .tint(.red)
                .sheet(isPresented: $showPasswordReset) {
                    ResetPasswordView()
                        .presentationDetents([.height(400), .large, .large])
                        .presentationDragIndicator(.hidden)
                }
            }
        }
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
