//
//  MainView.swift
//  FlavorVerse
//
//  Created by Lunick Francois on 8/31/23.
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
