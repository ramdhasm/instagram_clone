//
//  FeedView.swift
//  InstagramClone
//
//  Created by Ramdhas on 2023-06-22.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(){
                    LazyVStack(spacing: 34) {
                        ForEach(Post.MOCK_POSTS, id: \.id) { post in
                            FeedCell(post: post)
                        }
                    }
                }
            }
            .navigationTitle("Feed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image("instagram")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 90, height: 24)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "paperplane")
                        
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
