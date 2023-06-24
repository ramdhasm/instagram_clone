//
//  UploadPost.swift
//  InstagramClone
//
//  Created by Ramdhas on 2023-06-24.
//

import SwiftUI
import PhotosUI

struct UploadPost: View {
    @State var caption = ""
    @State var imagePickerPresented = false
    @State var photoitem: PhotosPickerItem?
    @StateObject var viewmodel = UploadPostViewModel()
    @Binding var tabIndex: Int
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    caption = ""
                    viewmodel.postImage = nil
                    viewmodel.selectedImage = nil
                    tabIndex = 0
                } label: {
                    Text("Cancel")
                }
                Spacer()
                Text("New Post")
                    .fontWeight(.semibold)
                Spacer()
                Button {
                    print("Upload")
                } label: {
                    Text("Upload")
                        .fontWeight(.semibold)
                }
            }
            .padding(.horizontal)
            HStack{
                if let postImage = viewmodel.postImage {
                    postImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                }
                
                TextField("Enter your caption", text: $caption, axis: .vertical)
            }
            .padding()
            Spacer()
        }
        .onAppear{
            imagePickerPresented.toggle()
        }
        .photosPicker(isPresented: $imagePickerPresented, selection: $viewmodel.selectedImage)
    }
}

struct UploadPost_Previews: PreviewProvider {
    static var previews: some View {
        UploadPost(tabIndex: .constant(0))
    }
}
