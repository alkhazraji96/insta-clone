//
//  StatusCardView.swift
//  Json
//
//  Created by Ameer Alkhazraji on 4/15/20.
//  Copyright © 2020 Ameer Alkhazraji. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct StatusCardView: View {
    var imName = ""
    var user = ""
    @Binding var show:Bool
    @Binding var user1: String
    @Binding var url:String
    
    var body: some View {
        
        VStack {
            AnimatedImage(url: URL(string:  imName))
            .resizable().frame(width: 60, height: 60).clipShape(Circle())
            .onTapGesture {
                self.user1 = self.user
                self.url = self.imName
                self.show.toggle()
        }
            Text(user).fontWeight(.light)
        
        }
        
    }
}

//struct StatusCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        StatusCardView()
//    }
//}
