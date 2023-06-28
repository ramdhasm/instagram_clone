//
//  UserStatView.swift
//  InstagramClone
//
//  Created by Ramdhas on 2023-06-22.
//

import SwiftUI

struct UserStatView: View {
    
    var title: String
    var value: Int

    var body: some View {
        VStack{
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
            Text("\(value)")
                .font(.footnote)
        }
        .frame(width:76)
    }
}

struct UserStatView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatView(title: "Posts", value: 10)
    }
}
