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
import FirebaseAuth

// Enum to represent various login-related errors
enum LoginError: Error {
    case emptyCredentials
    case wrongPassword
    case networkError
}


class LoginViewModel: ObservableObject {
    
    // MARK: - Properties
    
    // Published properties for email, password, username, and authentication status
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
        guard isValidEmail(email) else {
            DispatchQueue.main.async {
                self.errorMessage = "Please enter a valid email."
            }
            return
        }

        guard isValidPassword(password) else {
            DispatchQueue.main.async {
                self.errorMessage = "Please enter a valid password (minimum 8 characters)."
            }
            return
        }
        do {
            
            try await AuthService.shared.login(withemail: email, password: password)
            
            if AuthService.shared.isUserExists(withEmail: email) {
                // If the login succeeds, set isAuthenticated to true
                DispatchQueue.main.async {
                    self.isAuthenticated = true
                }
            }
        } catch let error as NSError {
            // Handle login error here
            if let errorCode = error as NSError? {
                switch errorCode.code {
                case AuthErrorCode.invalidUserToken.rawValue:
                    errorMessage = "User not found. Please check your email and try again."
                case AuthErrorCode.invalidCredential.rawValue:
                    errorMessage = "Wrong password. Please check your password and try again."
                case AuthErrorCode.missingEmail.rawValue:
                    errorMessage = "Email is missing. Please enter your email and try again."
                case AuthErrorCode.userNotFound.rawValue:
                    errorMessage = "User not found. Please Sign up or try again"
                case AuthErrorCode.accountExistsWithDifferentCredential.rawValue:
                    errorMessage = "Account exist with a different password. Please enter the correct password and try again"
                case AuthErrorCode.invalidEmail.rawValue:
                    errorMessage = "Email invalid. Please enter your correct email and try again."
                case AuthErrorCode.networkError.rawValue:
                    errorMessage = "Network error. Please check your internet connection and try again."
                default:
                    errorMessage = "Failed to log in. Please try again later."
                }
                // Set isAuthenticated to false on login failure
                DispatchQueue.main.async {
                    self.isAuthenticated = false
                }
            }
        }
    }
    
    // Email validation function
    func isValidEmail(_ email: String) -> Bool {
        // Check for a valid email format
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }

    // Password validation function
    func isValidPassword(_ password: String) -> Bool {
        // Check password criteria (e.g., minimum length)
        return password.count >= 8
    }
}
