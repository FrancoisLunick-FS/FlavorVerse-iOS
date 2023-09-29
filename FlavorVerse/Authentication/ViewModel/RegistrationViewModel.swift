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
import FirebaseAuth

enum RegistrationError: Error {
    case networkError
}


class RegistrationViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var email = ""
    @Published var password = ""
    @Published var username = ""
    @Published var isRegistered = false
    
    // Property to hold error messages
    @Published var errorMessage = ""
    
    /// Attempts new user registration with the provided username, email, and password.
    ///
    /// - Throws: An error if the login attempt fails.
    /// - Returns: A boolean indicating whether the login was successful.
    func createUser() async throws {
        // Reset error message
        DispatchQueue.main.async {
            self.errorMessage = ""
        }
        
        // Check if email and password are not empty
        guard !username.isEmpty, !email.isEmpty, !password.isEmpty else {
            // Set error message for invalid credentials
            DispatchQueue.main.async {
                self.errorMessage = "Please enter both email and password."
            }
            return
        }
        do {
            try await AuthService.shared.createUser(usingEmail: email, password: password, username: username)
            
            isRegistered = true
        } catch {
            if let errorCode = error as NSError? {
                switch errorCode.code {
                case AuthErrorCode.emailAlreadyInUse.rawValue:
                    errorMessage = "Email already in use. Please login or try a different email"
                case AuthErrorCode.networkError.rawValue:
                    errorMessage = "Network error. Please check your internet connection and try again."
                default:
                    errorMessage = "Failed to sign up. Please try again later."
                }
            }
            
            isRegistered = false
        }
        
    }
}
