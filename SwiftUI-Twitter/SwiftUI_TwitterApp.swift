//
//  SwiftUI_TwitterApp.swift
//  SwiftUI-Twitter
//
//  Created by Adam on 4/30/21.
//

import SwiftUI

@main
struct SwiftUI_TwitterApp: App {
    
    init() {
        UINavigationBar.appearance().barTintColor = UIColor.white
    }
    
    @State private var mainTab = false
    var body: some Scene {
        WindowGroup {
            NavigationView{
                    Authentication()
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
