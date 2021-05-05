//
//  ToolBar.swift
//  SwiftUI-Twitter
//
//  Created by Adam on 5/5/21.
//

import SwiftUI

struct ToolBar: ViewModifier {
    
    @EnvironmentObject var sideMenu: SideMenuData
    
    let navbarTitle: String?
    let navbarIcon: String?
    let iconName: String
    
    func body(content: Content) -> some View {
        
        NavigationView{
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
                            }else{
                                Image(navbarIcon!)
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
        }
        
    }
    
}
