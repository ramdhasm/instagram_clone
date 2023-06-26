//
//  EditProfileView.swift
//  InstagramClone
//
//  Created by Ramdhas on 2023-06-25.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @Environment (\.dismiss) var dismiss
    @StateObject var viewmodel: EditProfileViewModel
    init(user: User) {
        self._viewmodel = StateObject(wrappedValue: EditProfileViewModel(user: user))
    }
    
    var body: some View {
        VStack{
            HStack{
                Button("Cancel"){
                    dismiss()
                }
                Spacer()
                Text("Edit Profile")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Spacer()
                Button {
                    Task{
                        try await viewmodel.updateUserData()
                        dismiss()
                    }
                } label: {
                    Text("Done")
                        .font(.subheadline)
                        .fontWeight(.bold)
                }
            }.padding()
            
            Divider()
            
            PhotosPicker(selection: $viewmodel.selectedImage) {
                VStack{
                    if let image = viewmodel.profileImage {
                        image
                            .resizable()
                            .foregroundColor(.white)
                            .background(.gray)
                            .clipShape(Circle())
                            .frame(width: 80, height: 80)
                    } else {
                        CircularProfileImageView(user: viewmodel.user, size: .large)
                    }
                    Text("Edit Profile picture")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            Divider()
            
            VStack{
                EditProfileRowView(title: "Name", placeholder: "Enter Your Name", text: $viewmodel.fullname)
                EditProfileRowView(title: "Bio", placeholder: "Enter Your Bio", text: $viewmodel.bio)
            }
            Spacer()
        }
    }
}

struct EditProfileRowView: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    
    var body: some View{
        HStack{
            Text(title)
                .padding(.leading, 8)
                .frame(width: 100, alignment: .leading)
            VStack{
                TextField(placeholder, text: $text)
                Divider()
            }
        }
        .font(.subheadline)
        .frame(height: 30)
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(user: User.MOCK_USER[2])
    }
}
