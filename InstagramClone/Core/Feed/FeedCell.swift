//
//  FeedCell.swift
//  InstagramClone
//
//  Created by Ramdhas on 2023-06-22.
//

import SwiftUI

struct FeedCell: View {
    let post: Post!
    var body: some View {
        VStack {
            //Name and Image
            HStack(){
                Image(post.user?.profileImageUrl ?? "profilePlaceholder")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipShape(Circle())
                Text(post.user?.fullname ?? "No Name")
                    .font(.footnote)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding(.leading, 8)
            
            
            // Post Image
            Image(post.imageUrl)
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())

            HStack(spacing: 16){
                //Action items
                Button {
                    print("Like")
                } label: {
                    Image(systemName: "heart")
                        .foregroundColor(.black)
                        .imageScale(.large)
                }

                Button {
                    print("Comment")
                } label: {
                    Image(systemName: "bubble.right")
                        .foregroundColor(.black)
                        .imageScale(.large)
                }
                
                Button {
                    print("Share")
                } label: {
                    Image(systemName: "paperplane")
                        .foregroundColor(.black)
                        .imageScale(.large)
                }
                
                Spacer()
            }
            .padding(.leading, 8)
            .padding(.top, 4)
            
            //Like label
            HStack {
                Text("\(post.likes) Likes")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 10)
                    .padding(.top, 1)
                Spacer()
            }
            
            //Caption label
            HStack {
                Text(post.user?.fullname ?? "No Name")
                    .fontWeight(.semibold) +
                Text(" " + post.catpion)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.footnote)
            .padding(.leading, 10)
            .padding(.top, 1)
            
            //timestamp label
            
            HStack{
                Text("1hr")
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 0.1)
                    .padding(.leading, 10)
                    .foregroundColor(.gray)
                Spacer()
            }
            
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell(post: Post.MOCK_POSTS[4])
    }
}
