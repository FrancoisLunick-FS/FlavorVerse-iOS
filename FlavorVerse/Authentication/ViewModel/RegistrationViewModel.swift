//
//  RegistrationViewModel.swift
//  FlavorVerse
//
//  Created by Lunick Francois on 8/31/23.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published private var email = ""
    @Published private var password = ""
    @Published private var username = ""
}
