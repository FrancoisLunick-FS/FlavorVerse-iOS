//
//  RegistrationViewModel.swift
//  FlavorVerse
//
//  Created by Lunick Francois on 8/31/23.
//
//  Description: This file contains the RegistrationViewModel class, which is responsible for
//  managing user registration data and interactions in the FlavorVerse app. It provides properties
//  for email, password, and username, as well as a function to create a new user account.
//
//  You are welcome to use, modify, and distribute this code under the terms of the MIT license.
//  Please retain this header in all copies of the code.
//
//  Git Repository: https://github.com/FrancoisLunick-FS/FlavorVerse-iOS
//
//  Note: RegistrationViewModel is a critical component of the user registration process in the FlavorVerse app.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var username = ""
    
    func createUser() async throws {
        try await AuthService.shared.createUser(usingEmail: email, password: password, username: username)
    }
}
