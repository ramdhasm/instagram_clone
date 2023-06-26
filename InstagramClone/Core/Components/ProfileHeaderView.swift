//
//  ProfileHeaderView.swift
//  InstagramClone
//
//  Created by Ramdhas on 2023-06-24.
//

import SwiftUI

struct ProfileHeaderView: View {
    var user: User
    @State var showEditProfile =  false
    var body: some View {
        VStack(spacing: 10){
            HStack{
                CircularProfileImageView(user: user, size: .large)
                Spacer()
                HStack(spacing: 8) {
                    UserStatView(title: "Posts", value: 3)
                    UserStatView(title: "Followers", value: 14)
                    UserStatView(title: "Following", value: 20)
                }
            }
            .padding(.horizontal)
            
            VStack(alignment: .leading, spacing: 4){
                Text(user.fullname ?? "No Name")
                    .font(.footnote)
                    .fontWeight(.semibold)
                Text(user.bio ?? "")
                    .font(.footnote)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            Button {
                if user.isCurrentUser {
                    showEditProfile.toggle()
                }
            } label: {
                Text(user.isCurrentUser ? "Edit Profile" : "Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .background(user.isCurrentUser ? .white : Color(.systemBlue))
                    .foregroundColor(user.isCurrentUser ? .black :.white)
                    .cornerRadius(6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(.gray, lineWidth: 1))
            }
            Divider()
        }
        .fullScreenCover(isPresented: $showEditProfile) {
            EditProfileView(user: user)
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: User.MOCK_USER[0])
    }
}
