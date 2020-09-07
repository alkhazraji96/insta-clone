//
//  PostObserver.swift
//  Json
//
//  Created by Ameer Alkhazraji on 4/16/20.
//  Copyright © 2020 Ameer Alkhazraji. All rights reserved.
//

import Foundation
import Firebase

class PostObserver:ObservableObject {
    
    @Published var posts = [DataType1]()
    
    init() {
        let db = Firestore.firestore()
        db.collection("posts").addSnapshotListener { (snap, error) in
            if error != nil {
                print((error?.localizedDescription)!)
                return
            }
            
            for i in snap!.documentChanges {
                if i.type == .added {
                    let id = i.document.documentID
                    let name = i.document.get("name") as! String
                    let image = i.document.get("image") as! String
                    let comment = i.document.get("comments") as! String
                    let likes = i.document.get("likes") as! String
                    self.posts.append(DataType1(id: id, name: name, image: image, comments: comment, likes: likes))
                }
                if i.type == .removed {
                    let id = i.document.documentID
                    
                    for j in 0..<self.posts.count {
                        if self.posts[j].id == id {
                            self.posts.remove(at: j)
                            return
                        }
                        
                    }
                }
                if i.type == .modified {
                    let id = i.document.documentID
                    let likes = i.document.get("likes") as! String
                    
                    for j in 0..<self.posts.count {
                        if self.posts[j].id == id {
                            self.posts[j].likes = likes
                            return
                        }
                        
                    }
                }
            }
        }
    }
}
