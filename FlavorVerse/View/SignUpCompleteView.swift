//
//  SignUpCompleteView.swift
//  FlavorVerse
//
//  Created by Lunick Francois on 8/31/23.
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
