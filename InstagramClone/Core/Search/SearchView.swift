//
//  SearchView.swift
//  InstagramClone
//
//  Created by Ramdhas on 2023-06-23.
//

import SwiftUI

struct SearchView: View { 
    @StateObject var viewmodel = SearchViewModel()
    @State private var query = ""
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVStack(spacing: 12){
                    ForEach(viewmodel.users, id: \.id) { user in
                        NavigationLink(value: user) {
                            HStack{
                                CircularProfileImageView(user: user, size: .small)
                                VStack(alignment: .leading){
                                    Text(user.username)
                                        .fontWeight(.semibold)
                                    if let fullname = user.fullname {
                                        Text(fullname)
                                    }
                                }
                                .foregroundColor(.black)
                                .font(.footnote)
                                Spacer()
                            }
                            
                            .padding(.horizontal)
                        }
                    }
                }
                .padding(.top, 8)
                .searchable(text: $query, prompt: "search")
            }
            .navigationDestination(for: User.self, destination: { user in
                SecondPersonProfileView(user: user)
            })
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
