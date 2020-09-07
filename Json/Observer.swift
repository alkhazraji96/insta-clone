//
//  Observer.swift
//  Json
//
//  Created by Ameer Alkhazraji on 4/16/20.
//  Copyright © 2020 Ameer Alkhazraji. All rights reserved.
//

import Foundation
import Firebase

class Observer:ObservableObject {
    
    @Published var status = [DataType]()
    
    init() {
        let db = Firestore.firestore()
        db.collection("status").addSnapshotListener { (snap, error) in
            if error != nil {
                print((error?.localizedDescription)!)
                return
            }
            
            for i in snap!.documentChanges {
                if i.type == .added {
                    let id = i.document.documentID
                    let name = i.document.get("name") as! String
                    let image = i.document.get("image") as! String
                    self.status.append(DataType(id: id, name: name, image: image))
                }
                if i.type == .removed {
                    let id = i.document.documentID
                    
                    for j in 0..<self.status.count {
                        if self.status[j].id == id {
                            self.status.remove(at: j)
                            return
                        }
                        
                    }
                }
            }
        }
    }
}
