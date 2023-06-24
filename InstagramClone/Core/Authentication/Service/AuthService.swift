//
//  AuthService.swift
//  InstagramClone
//
//  Created by Ramdhas on 2023-06-24.
//

import Foundation
import FirebaseAuth

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    func login(email: String, password: String) async throws {
        
    }
    
    func createUserAccount(email: String, password: String, userName: String) async throws {
        
    }
    
    func loadUserData() async throws {
        
    }
    
    func logout() {
        
    }
    
}
