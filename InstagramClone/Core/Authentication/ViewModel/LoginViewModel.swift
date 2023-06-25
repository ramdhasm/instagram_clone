//
//  LoginViewModel.swift
//  InstagramClone
//
//  Created by Ramdhas on 2023-06-25.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func login() async throws {
        try await AuthService.shared.login(email: email, password: password)
    }
}
