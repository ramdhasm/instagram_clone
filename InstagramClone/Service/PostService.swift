//
//  PostService.swift
//  InstagramClone
//
//  Created by Ramdhas on 2023-06-27.
//

import Foundation
import Firebase

struct PostService {
    
    static var postCollection = Firestore.firestore().collection("posts")
    
    static func fetchFeedPost() async throws -> [Post] {
        let snapshot = try await postCollection.getDocuments()
        var posts = try snapshot.documents.compactMap({try $0.data(as: Post.self)})
        
        for i in 0..<posts.count {
            let post = posts[i]
            let postOwnerID = post.ownerUid
            let user = try await UserService.fetchSpecificUser(uid: postOwnerID)
            posts[i].user = user
         }
        
        return posts
    }
    
    static func fetchUserPost(uid: String) async throws -> [Post] {
        let snapshot = try await postCollection.whereField("ownerUid", isEqualTo: uid).getDocuments()
        return try snapshot.documents.compactMap({ try $0.data(as: Post.self) })
    }
}
