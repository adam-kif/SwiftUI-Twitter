//
//  SideMenu.swift
//  SwiftUI-Twitter
//
//  Created by Adam on 5/5/21.
//

import SwiftUI

struct SideMenu: View {
    
    @EnvironmentObject var sideMenu: SideMenuData
    
    let width: CGFloat = 300

    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(Color.darkColor.opacity(0.1))
            .opacity(sideMenu.isOpen ? 1.0 : 0.0)
            .animation(Animation.easeIn.delay(0.25))
            .onTapGesture {
                sideMenu.isOpen.toggle()
            }
            
            HStack {
                Text("Hello")
                    .frame(width: width)
                    .background(Color.white)
                    .offset(x: sideMenu.isOpen ? 0 : -width)
                    .animation(.default)
                
                Spacer()
            }
        }
    }
}


struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMenu()
    }
}
