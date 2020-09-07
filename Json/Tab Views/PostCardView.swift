//
//  PostCardView.swift
//  Json
//
//  Created by Ameer Alkhazraji on 4/15/20.
//  Copyright © 2020 Ameer Alkhazraji. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
import Firebase

struct PostCardView: View {
    var user = ""
    var image = ""
    var id = ""
    var likes = ""
    var comments = ""
    
    var body: some View {
        VStack(alignment: .leading, content: {
            HStack {
                AnimatedImage(url: URL(string: image)).resizable().frame(width: 30, height: 30).clipShape(Circle())
                Text(user)
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "ellipsis").resizable().frame(width: 15, height: 15).rotationEffect(.init(degrees: 90))
                    }).foregroundColor(Color("darkAndWhite"))
                
            }
                AnimatedImage(url: URL(string: image)).resizable().frame(height: 350)
                
                HStack{
                    
                    Button(action: {
                        let like = Int.init(self.likes)!
                        let db = Firestore.firestore()
                        db.collection("posts").document(self.id).updateData(["likes":"\(like + 1)"]) { (error) in
                            if error != nil {
                                print(error!.localizedDescription)
                                return
                            }
                        }
                    }, label: {
                        Image(systemName: "heart").resizable().frame(width: 26, height: 26)
                        }).foregroundColor(Color("darkAndWhite"))
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "message").resizable().frame(width: 26, height: 26)
                        }).foregroundColor(Color("darkAndWhite"))
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "bookmark").resizable().frame(width: 30, height: 30)
                        }).foregroundColor(Color("darkAndWhite"))
                }.padding(.top, 8)
            
            Text("\(likes) Likes").padding(.top, 8)
            Text("View all \(comments) comments")
            
        }).padding(8)
    }
}

struct PostCardView_Previews: PreviewProvider {
    static var previews: some View {
        PostCardView()
    }
}
