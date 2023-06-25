//
//  ContentViewModel.swift
//  InstagramClone
//
//  Created by Ramdhas on 2023-06-24.
//

import Foundation
import FirebaseAuth
import Combine

class ContentViewModel: ObservableObject {
    @Published var userSession1: FirebaseAuth.User?
    @Published var currentUser: User?
    
    private var service = AuthService.shared
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    func setupSubscribers() {
        service.$userSession.sink { [weak self] user in
            self?.userSession1 = user
        }
        .store(in: &cancellable)
        
        service.$currentUser.sink { [weak self] currentUser in
            self?.currentUser = currentUser
        }
        .store(in: &cancellable)
    }
    
}
