//
//  ContentView.swift
//  InstagramClone
//
//  Created by Ramdhas on 2023-06-22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel =  ContentViewModel()
    @StateObject var registrationViewModel = RegistrationViewModel()

    var body: some View {
        Group {
            if viewModel.userSession1 == nil {
                LoginView()
                    .environmentObject(registrationViewModel)
            } else if let user = viewModel.currentUser {
                MainTabView(user: user)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
