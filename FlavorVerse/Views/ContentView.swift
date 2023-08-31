//
//  ContentView.swift
//  FlavorVerse
//
//  Created by Lunick Francois on 8/31/23.
//
//  Description: This file contains the main content view for the FlavorVerse app.
//  FlavorVerse is a recipe exploration app that allows users to discover and cook a wide variety of dishes.
//
//  The app provides an interactive cooking experience, step-by-step instructions, and a range of recipes
//  to cater to diverse tastes and preferences.
//
//
//  You are welcome to use, modify, and distribute this code under the terms of the MIT license.
//  Please retain this header in all copies of the code.
//


import SwiftUI

struct ContentView: View {
    
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
        
//        VStack {
//            Image("niagarafalls")
//                .resizable()
//                .cornerRadius(10)
//                .aspectRatio(contentMode: .fit)
//                .padding(.all)
//
//            Text("Niagara Falls")
//        }
        

        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
