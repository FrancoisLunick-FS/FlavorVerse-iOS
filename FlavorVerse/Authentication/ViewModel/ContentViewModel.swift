//
//  ContentViewModel.swift
//  FlavorVerse
//
//  Created by Lunick Francois on 8/31/23.
//
//  Description: This file contains the view model for managing user authentication in the FlavorVerse app.
//  It uses Firebase for authentication and provides bindings for user session state.
//
//  You are welcome to use, modify, and distribute this code under the terms of the MIT license.
//  Please retain this header in all copies of the code.
//
//  Git Repository: https://github.com/FrancoisLunick-FS/FlavorVerse-iOS
//
//  Note: The FlavorVerse app is designed for recipe exploration and cooking.
//


import Foundation
import Firebase
import Combine

@MainActor
class ContentViewModel: ObservableObject {
    
    // MARK: - Properties
    
    private let service = AuthService.shared
    private var cancellables = Set<AnyCancellable>()
    
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        
    }
    
    // MARK: - Functions
    
    /// Sets up the user session monitoring.
    func setup() {
        service.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &cancellables)
    }
}
