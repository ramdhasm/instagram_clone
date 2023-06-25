//
//  SeachViewModel.swift
//  InstagramClone
//
//  Created by Ramdhas on 2023-06-25.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task {
            await fetchAllUser()
        }
    }
    
    @MainActor
    func fetchAllUser() async {
        users = try! await UserService.fetchAllUsers()
    }
    
    
}
