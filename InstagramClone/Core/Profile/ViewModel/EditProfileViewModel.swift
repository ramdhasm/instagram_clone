//
//  EditProfileViewModel.swift
//  InstagramClone
//
//  Created by Ramdhas on 2023-06-25.
//

import Foundation
import PhotosUI
import SwiftUI
import Firebase

@MainActor
class EditProfileViewModel: ObservableObject {
    @Published var user: User
    @Published var profileImage: Image?
    @Published var fullname = ""
    @Published var bio = ""
    @Published var uiImage: UIImage?
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task {
                await loadImage(fromItem: selectedImage)
            }
        }
    }
    
    init(user: User){
        self.user = user
    }
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else {return}
        guard let data = try? await item.loadTransferable(type: Data.self) else {return}
        guard let uiImage = UIImage(data: data) else {return}
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    func updateUserData() async throws {
        var userData = [String: Any]()
        if !fullname.isEmpty && user.fullname != fullname {
            userData["fullname"] = fullname
        }
        
        if let uiImage = uiImage {
            let imageURL = try? await ImageUploader.uploadImage(image: uiImage)
            userData["profileImageUrl"] = imageURL
        }
        
        
        if !bio.isEmpty && user.bio != bio {
           userData["bio"] = bio
        }
        
        if !userData.isEmpty {
            try await Firestore.firestore().collection("users").document(user.id).updateData(userData)
        }
        
    }
    
}
