//
//  RegistrationViewModel.swift
//  FlavorVerse
//
//  Created by Lunick Francois on 8/31/23.
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
