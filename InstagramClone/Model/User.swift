//
//  User.swift
//  InstagramClone
//
//  Created by Ramdhas on 2023-06-23.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    let email: String
}

extension User {
    static var MOCK_USER: [User] = [
        .init(id: NSUUID().uuidString, username: "ramdhas", profileImageUrl: "ramdhas", fullname: "Ramdhas M", bio: "Software Engineer", email: "ramdhas@gmail.com"),
        .init(id: NSUUID().uuidString, username: "sohail", profileImageUrl: "profile_01", fullname: "Sohail Rahman", bio: "Software Engineer", email: "Sohail@gmail.com"),
        .init(id: NSUUID().uuidString, username: "dhamu", profileImageUrl: "profile_02", fullname: "Dhamu Diran", bio: "Software Engineer", email: "Dhamu@gmail.com"),
        .init(id: NSUUID().uuidString, username: "maria", profileImageUrl: "profile_03", fullname: "Maria Lindh", bio: "Project Manager", email: "Chidambaram@gmail.com"),
        .init(id: NSUUID().uuidString, username: "veronica", profileImageUrl: "profile_04", fullname: "Veronica Jelen", bio: "UX Designer", email: "Vinoth@gmail.com")
    ]
}
