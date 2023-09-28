//
//  LoginViewModel.swift
//  FlavorVerse
//
//  Created by Lunick Francois on 9/27/23.
//
//  Description: This file contains the LoginViewModel class, which is responsible for
//  managing user login data and interactions in the FlavorVerse app. It provides properties
//  for email, password, and user authentication status, as well as a function to attempt user login.
//
//  You are welcome to use, modify, and distribute this code under the terms of the MIT license.
//  Please retain this header in all copies of the code.
//
//  Git Repository: https://github.com/FrancoisLunick-FS/FlavorVerse-iOS
//
//  Note: LoginViewModel is a critical component of user login functionality in the FlavorVerse app.
//

import Foundation

enum LoginError: Error {
    case emptyCredentials
    case wrongPassword
    case networkError
    // Add more error cases as needed
}


class LoginViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var email = ""
    @Published var password = ""
    @Published var username = ""
    @Published var isAuthenticated = false
    
    // Property to hold error messages
    @Published var errorMessage = ""
    
    // MARK: - Functions
    
    /// Attempts to log in the user with the provided email and password.
    ///
    /// - Throws: An error if the login attempt fails.
    /// - Returns: A boolean indicating whether the login was successful.
    func loginUser() async throws {
        do {
            // Reset error message
            DispatchQueue.main.async {
                self.errorMessage = ""
            }
            
            // Check if email and password are not empty
            guard !email.isEmpty, !password.isEmpty else {
                DispatchQueue.main.async {
                    self.errorMessage = "Please enter both email and password."
                }
                return
            }
            
            try await AuthService.shared.login(withemail: email, password: password)
            // If the login succeeds, set isAuthenticated to true
            DispatchQueue.main.async {
                self.isAuthenticated = true
            }
        } catch {
            // Handle login error here
            switch error {
            case LoginError.wrongPassword:
                errorMessage = "Invalid email or password. Please check your credentials and try again."
            case LoginError.networkError:
                errorMessage = "Network error. Please check your internet connection and try again."
            default:
                errorMessage = "Failed to log in. Please try again later."
            }
            // Handle login error here (e.g., display an error message)
            DispatchQueue.main.async {
                self.isAuthenticated = false
            }
        }
    }
}