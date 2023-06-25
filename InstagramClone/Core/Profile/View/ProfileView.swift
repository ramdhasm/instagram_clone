//
//  ProfileView.swift
//  InstagramClone
//
//  Created by Ramdhas on 2023-06-22.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User!
    var posts: [Post] {
        return Post.MOCK_POSTS.filter({$0.user?.fullname == user.fullname})
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                //Header
                ProfileHeaderView(user: user)
                //Post View
                PostGridView(posts: posts)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        AuthService.shared.logout()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.black)
                    }

                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.MOCK_USER[4])
    }
}
