//
//  AuthService.swift
//  FlavorVerse
//
//  Created by Lunick Francois on 8/31/23.
//
//  Description: This file contains the AuthService class responsible for handling user authentication
//  and managing user sessions in the FlavorVerse app. It provides functions for user login, account creation,
//  and signing out.
//
//  You are welcome to use, modify, and distribute this code under the terms of the MIT license.
//  Please retain this header in all copies of the code.
//
//  Git Repository: https://github.com/FrancoisLunick-FS/FlavorVerse-iOS
//
//  Note: AuthService is a critical component of user authentication in the FlavorVerse app.
//


import Foundation
import FirebaseAuth

class AuthService {
    
    // MARK: - Properties
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    // MARK: - Initialization
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    // MARK: - User Authentication
    
    /// Handles user login.
    /// - Parameters:
    ///   - email: user's email
    ///   - password: user's password
    func login(withemail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
        } catch {
            print("DEBUG: Failed to register user with error: \(error.localizedDescription)")
        }
    }
    
    /// Handles the creaton of a new user account.
    /// - Parameters:
    ///   - email: new user's email
    ///   - password: new user's password
    ///   - username: new user's username
    func createUser(usingEmail email: String, password: String, username: String) async throws {
        
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
        } catch {
            print("DEBUG: Failed to login user with error: \(error.localizedDescription)")
        }
    }
    
    
    /// Signs the user out
    func signOut() {
        try? Auth.auth().signOut()
        self.userSession = nil
    }
}
