//
//  ProfileHeaderView.swift
//  InstagramClone
//
//  Created by Ramdhas on 2023-06-24.
//

import SwiftUI

struct ProfileHeaderView: View {
    var user: User
    
    var body: some View {
        VStack(spacing: 10){
            HStack{
                Image(user.profileImageUrl ?? "")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
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
                
            } label: {
                Text("Edit Profile")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .frame(width: 360, height: 32)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(.gray, lineWidth: 1))
            }
            
            Divider()
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: User.MOCK_USER[0])
    }
}
