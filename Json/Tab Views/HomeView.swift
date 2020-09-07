//
//  HomeView.swift
//  Json
//
//  Created by Ameer Alkhazraji on 4/15/20.
//  Copyright © 2020 Ameer Alkhazraji. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var observed = Observer()
    @ObservedObject var postObserver = PostObserver()
    @State var show = false
    @State var user = ""
    @State var url = ""
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(observed.status) { i in
                            StatusCardView(imName: i.image, user: i.name, show: self.$show, user1: self.$user, url: self.$url).padding([.leading, .top], 10)
                        }
                    }.animation(.spring())
                }
                if postObserver.posts.isEmpty {
                    Text("No Posts").fontWeight(.heavy)
                } else {
                    ForEach(postObserver.posts) { i in
                        PostCardView(user: i.name, image: i.image, id: i.id, likes: i.likes, comments: i.comments)
                    }
                }
            }
        }.sheet(isPresented: $show) {
            StatusView(url: self.url, name: self.user)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
