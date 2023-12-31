//
//  MainTabView.swift
//  DocuPulse
//
//  Created by Matthew Houston on 7/18/23.
//

import SwiftUI

struct MainTabView: View {
    
    @State var selectedIndex = 0
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                        .onTapGesture {
                            selectedIndex = 0
                        }
                }
                .tag(0)
            
            FilesView()
                .tabItem {
                    Label("Files", systemImage: "folder")
                        .onTapGesture {
                            selectedIndex = 1
                        }
                }
                .tag(1)
            
            PayWallView()
                .tabItem {
                    Label("Premium", systemImage: "star")
                        .onTapGesture {
                            selectedIndex = 2
                        }
                }
                .tag(2)
            
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person.crop.circle")
                        .onTapGesture {
                            selectedIndex = 3
                        }
                }
                .tag(3)
            }
        }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
