//
//  Notifications.swift
//  SwiftUI-Twitter
//
//  Created by Adam on 4/30/21.
//

import SwiftUI

struct Notifications: View {
    var body: some View {
        VStack{
            Text("Feeed Screen")
            
        }//End of VSTack
        .modifier(ToolBar(navbarTitle: "Notifications", navbarIcon: nil, iconName: "gearshape"))
    }
}

struct Notifications_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        Notifications()
        }
    }
}
