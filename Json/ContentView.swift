//
//  ContentView.swift
//  Json
//
//  Created by Ameer Alkhazraji on 4/15/20.
//  Copyright © 2020 Ameer Alkhazraji. All rights reserved.
//

import SwiftUI
import Firebase



struct ContentView: View {
    var body: some View {
        TabView {
            NavigationView {
                HomeView()
                    .navigationBarTitle("Instagram", displayMode: .inline)
                    .navigationBarItems(leading: Button(action: {
                        
                    }, label: {
                        Image(systemName: "camera").resizable()
                    }), trailing: Button(action: {
                        
                    }, label: {
                        HStack {
                            Image(systemName: "paperplane").resizable()
                        }
                    })).foregroundColor(Color("darkAndWhite"))
                    
                
                
            }.tabItem {
                Image(systemName: "house")
            }
            Text("Find").tabItem {
                Image(systemName: "magnifyingglass")
            }
            
            Text("Upload").tabItem {
                Image(systemName: "plus.app")
            }
            
            Text("Likes").tabItem {
                Image(systemName: "heart")
            }
            
            Text("Profile").tabItem {
                Image(systemName: "person")
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



