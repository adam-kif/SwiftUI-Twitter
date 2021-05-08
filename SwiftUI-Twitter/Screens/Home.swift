//
//  Home.swift
//  SwiftUI-Twitter
//
//  Created by Adam on 4/30/21.
//

import SwiftUI

struct Home: View {
    var body: some View {
//        NavigationView{
        VStack{
            Text("Feeed Screen")
            
        }//End of VSTack
        .modifier(NavigationBar(navbarTitle: nil, navbarIcon: "twitter-logo", iconName: "wand.and.stars"))
    }
//    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            Home()
                .environmentObject(SideMenuData())
        }
    }
}
