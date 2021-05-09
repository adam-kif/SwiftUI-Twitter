//
//  NavigationBar.swift
//  SwiftUI-Twitter
//
//  Created by Adam on 5/5/21.
//

import SwiftUI

struct NavigationBar: ViewModifier {
    
    @EnvironmentObject var sideMenu: SideMenuData
    
    let navbarTitle: String?
    let navbarIcon: String?
    let iconName: String
    
    @State private var searchInput = ""
    
    func body(content: Content) -> some View {
        
//        NavigationView{
            ZStack{
                
                content
                    .navigationBarHidden(sideMenu.isOpen ? true : false)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Image("menu")
                                .onTapGesture {
                                    sideMenu.isOpen.toggle()
                                }
                        }
                        
                        ToolbarItem(placement: .principal) {
                            if navbarTitle != nil{
                                Text(navbarTitle!)
                                    .font(.title3)
                                    .foregroundColor(.darkColor)
                                    .bold()
                            }else if navbarIcon != nil{
                                Image(navbarIcon!)
                            }else{
                                SearchBar(searchInput: $searchInput)
                            }
                        }
                        
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Image(systemName: iconName)
                                .imageScale(.large)
                                .onTapGesture {
                                    print("Icons")
                                }
                        }
                    }
                    .foregroundColor(Color("primary"))
                
                SideMenu()
                
                
            }//End of ZSTack
            .ignoresSafeArea()
//        }
    }
    
}
