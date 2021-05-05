//
//  MainTabView.swift
//  SwiftUI-Twitter
//
//  Created by Adam on 4/30/21.
//

import SwiftUI

struct MainTabView: View {
    
    @State private var selectedTab = 0
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            
            Home()
                .environmentObject(SideMenuData())
                
                .tabItem {
                    Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                }
                .tag(0)
            
            Explore()
                .environmentObject(SideMenuData())
                
                .tabItem {
                    Image(selectedTab == 0 ? "search" : "search_fill")
                    
                }
                .tag(1)
            
            
            Notifications()
                .environmentObject(SideMenuData())
                
                .tabItem {
                    Image(systemName: selectedTab == 2 ? "bell.fill" : "bell")
                }
                .tag(2)
            
            
            Messages()
                .environmentObject(SideMenuData())
                .tabItem {
                    Image(systemName: selectedTab == 3 ? "envelope.fill" : "envelope")
                }
                .tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
