//
//  PostGridView.swift
//  InstagramClone
//
//  Created by Ramdhas on 2023-06-24.
//

import SwiftUI

struct PostGridView: View {
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    let imageDimention: CGFloat = UIScreen.main.bounds.width/3 - 1
    let posts: [Post]
    
    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 1) {
            ForEach(posts, id: \.id) {post in
                Image(post.imageUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageDimention, height: imageDimention)
                    .clipped()
            }
        }
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView(posts: Post.MOCK_POSTS)
    }
}
