//
//  SignUpCompleteView.swift
//  FlavorVerse
//
//  Created by Lunick Francois on 8/31/23.
//
//  Description: This file contains the sign-up completion view for the FlavorVerse app.
//  The sign-up completion view welcomes the user after successful registration and allows them to start using the app.
//
//  You are welcome to use, modify, and distribute this code under the terms of the MIT license.
//  Please retain this header in all copies of the code.
//
//  Note: This view is part of the FlavorVerse app, which is designed for recipe exploration and cooking.
//

import SwiftUI

struct SignUpCompleteView: View {
    @State private var showHome = false
    
    @EnvironmentObject var viewModel: RegistrationViewModel
    
    var body: some View {
        
        VStack {
            Text("Welcome to FlavorVerse, \(viewModel.username)")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .bold()
                .foregroundColor(.black)
            
            Text("Click below to complete registration and start cooking with FlavorVerse")
                .font(.caption)
                .multilineTextAlignment(.center)
                .bold()
                .foregroundColor(.gray)
            
            Button {
                withAnimation {
                    showHome.toggle()
                }
                
            } label: {
                Text("Lets Start Cooking")
                    .foregroundColor(.white)
                    .font(.body)
                    .frame(maxWidth: 200)
            }
            .padding(.all)
            .buttonStyle(.borderedProminent)
            .tint(.red)
            .fullScreenCover(isPresented: $showHome) {
                HomeView()
                    .presentationDetents([.height(400), .large, .large])
            }
        }
    }
}

struct SignUpCompleteView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpCompleteView()
    }
}
