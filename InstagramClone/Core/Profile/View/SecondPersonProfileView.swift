//
//  SecondPersonProfileView.swift
//  InstagramClone
//
//  Created by Ramdhas on 2023-06-24.
//

import SwiftUI

struct SecondPersonProfileView: View {
    
    let user: User!
    var posts: [Post] {
        return Post.MOCK_POSTS.filter({$0.user?.fullname == user.fullname})
    }
    let imageDimention: CGFloat = UIScreen.main.bounds.width/3 - 1
    var body: some View {
            ScrollView {
                //Header
                ProfileHeaderView(user: user)
                //Post View
                PostGridView(user: user)

            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct SecondPersonProfileView_Previews: PreviewProvider {
    static var previews: some View {
        SecondPersonProfileView(user: User.MOCK_USER[1])
    }
}
