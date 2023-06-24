//
//  UploadPostViewModel.swift
//  InstagramClone
//
//  Created by Ramdhas on 2023-06-24.
//

import Foundation
import SwiftUI
import PhotosUI

class UploadPostViewModel: ObservableObject {

    @Published var postImage: Image?
    
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
    }
    
    
}
