//
//  Post.swift
//  InstagramClone
//
//  Created by Ramdhas on 2023-06-24.
//

import Foundation

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    let catpion: String
    var likes: Int
    let imageUrl: String
    let timestamp: Date
    var user: User?
}

extension Post {
    static var MOCK_POSTS: [Post] = [
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, catpion: "5 Signs Of A Weak Mindset", likes: 29, imageUrl: "sample_01", timestamp: Date(), user: User.MOCK_USER[0]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, catpion: "Highest Paid Careers...", likes: 44, imageUrl: "UseState", timestamp: Date(), user: User.MOCK_USER[1]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, catpion: "Mistakes That Kill Startups", likes: 877, imageUrl: "sample_03", timestamp: Date(), user: User.MOCK_USER[2]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, catpion: "Make Your Free Time Useful...", likes: 998, imageUrl: "sample_04", timestamp: Date(), user: User.MOCK_USER[3]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, catpion: "The Time Will Never Be Perfect...", likes: 342, imageUrl: "sample_05", timestamp: Date(), user: User.MOCK_USER[4])
    ]
}
