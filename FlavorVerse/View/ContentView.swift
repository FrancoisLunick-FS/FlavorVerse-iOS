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
    // MARK: - Properties
    // Initialize the view model
    @StateObject var viewModel = ContentViewModel()
    // Initialize the Registration view model
    @StateObject var registrationViewModel = RegistrationViewModel()
    
    // MARK: - Body
    var body: some View {
        Group {
            // Check if a user session exists
            if viewModel.userSession == nil {
                // If no user session exists, display the LoginView
                LoginView()
                    .environmentObject(registrationViewModel)
            } else {
                // If a user session exists, display the MainView
                MainView()
            }
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
