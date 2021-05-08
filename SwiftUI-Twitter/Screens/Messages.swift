//
//  Messages.swift
//  SwiftUI-Twitter
//
//  Created by Adam on 4/30/21.
//

import SwiftUI

struct Messages: View {
    var body: some View {
        VStack{
            Text("Feeed Screen")
            
        }//End of VSTack
        .modifier(NavigationBar(navbarTitle: "Messages", navbarIcon: nil, iconName: "gearshape"))
    }
}

struct Messages_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            Messages()
                .environmentObject(SideMenuData())
        }
    }
}
