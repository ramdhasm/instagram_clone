//
//  ImageUploadService.swift
//  InstagramClone
//
//  Created by Ramdhas on 2023-06-25.
//

import Foundation
import Firebase
import FirebaseStorage

struct ImageUploader{
    static func uploadImage(image: UIImage) async throws -> String? {
        guard let image = image.jpegData(compressionQuality: 0.5) else {return nil}
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        do {
            let _ = try await ref.putDataAsync(image)
            let url = try await ref.downloadURL()
            return url.absoluteString
        } catch {
            print("Image upload failed")
            return nil
        }
    }
}
