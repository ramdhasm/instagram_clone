//
//  RegistrationViewModel.swift
//  InstagramClone
//
//  Created by Ramdhas on 2023-06-24.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var username = ""
    
    func createUser() async throws{
        try await AuthService.shared.createUserAccount(email: email, password: password, userName: username)
        email = ""
        password = ""
        username = ""
    }
}
