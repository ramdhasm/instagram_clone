//
//  UploadPostViewModel.swift
//  InstagramClone
//
//  Created by Ramdhas on 2023-06-24.
//

import Foundation
import SwiftUI
import PhotosUI
import Firebase

@MainActor
class UploadPostViewModel: ObservableObject {
    @Published var postImage: Image?
    private var uiImage: UIImage?
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task {
                await loadImage(fromItem: selectedImage)
            }
        }
    }
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else {return}
        guard let data = try? await item.loadTransferable(type: Data.self) else {return}
        guard let uiImage = UIImage(data: data) else {return}
        self.postImage = Image(uiImage: uiImage)
        self.uiImage = uiImage
    }
    
    func uploadPostImage(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let uiImage = uiImage else {return}
        
        let postRef = Firestore.firestore().collection("posts").document()
        guard let imageURL = try? await ImageUploader.uploadImage(image: uiImage) else {return}
        let post = Post(id: postRef.documentID, ownerUid: uid, catpion: caption, likes: 0, imageUrl: imageURL, timestamp: Timestamp())
        guard let decodedPost = try? Firestore.Encoder().encode(post) else {return}
        try await postRef.setData(decodedPost)
    }
}
