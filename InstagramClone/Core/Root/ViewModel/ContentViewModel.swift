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
    @Published var userSession: FirebaseAuth.User?
    private var service = AuthService.shared
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        
    }
    
    func setupSubscribers() {
        service.$userSession.sink { [weak self] user in
            self?.userSession = user
        }
        .store(in: &cancellable)
    }
    
}
