//
//  MainTabView.swift
//  SwiftUI-Twitter
//
//  Created by Adam on 4/30/21.
//

import SwiftUI

//MARK: - Enum CustomTab
enum CustomTab : String{
    case Home
    case Explore
    case Notifications
    case Messages
}

struct MainTabView: View {
    
    @State private var currentTab: CustomTab = .Home
    
    var tabs: [CustomTab] = [.Home, .Explore, .Notifications, .Messages]
    
    var body: some View {
        
        VStack{
            
            switch currentTab {
            case .Home:
                Home()
                    .environmentObject(SideMenuData())
                
            case .Explore:
                Explore()
                    .environmentObject(SideMenuData())
                
            case .Notifications:
                Notifications()
                    .environmentObject(SideMenuData())
                
            case .Messages:
                Messages()
                    .environmentObject(SideMenuData())
                
            }
            
            Spacer()
            
            HStack{
                Spacer()
                
                //MARK: - Home Tab
                VStack{
                    Rectangle()
                        .frame( height: 4)
                        .foregroundColor(currentTab == .Home ? .primaryColor : .gray.opacity(0.2))
                    
                    Button(action: {
                        currentTab = .Home
                    }){
                        Image(systemName: currentTab == .Home ? "house.fill" : "house")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .foregroundColor( currentTab == .Home ? .primaryColor : .gray.opacity(0.4))
                            .padding(.vertical, 0.02)
                        
                    }//End of Button
                }//End of VStack
                
                //MARK: - Explore Tab
                VStack{
                    Rectangle()
                        .frame( height: 3)
                        .foregroundColor(currentTab == .Explore ? .primaryColor : .gray.opacity(0.2))
                    
                    Button(action: {
                        currentTab = .Explore
                    }){
                        Image(currentTab == .Explore ? "search" : "search_fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .foregroundColor( currentTab == .Explore ? .primaryColor : .gray.opacity(0.4))
                            .padding(.vertical, 0.02)
                    }//End of Button
                }//End of VStack
                
                //MARK: - Notifications Tab
                VStack{
                    Rectangle()
                        .frame(height: 3)
                        .foregroundColor(currentTab == .Notifications ? .primaryColor : .gray.opacity(0.2))
                    
                    Button(action: {
                        currentTab = .Notifications
                    }){
                        Image(systemName: currentTab == .Notifications ? "bell.fill" : "bell")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .foregroundColor( currentTab == .Notifications ? .primaryColor : .gray.opacity(0.4))
                            .padding(.vertical, 0.02)
                    }//End of Button
                }//End of VStack
                
                //MARK: - Messages Tab
                VStack{
                    Rectangle()
                        .frame(height: 3)
                        .foregroundColor(currentTab == .Messages ? .primaryColor : .gray.opacity(0.2))
                    
                    Button(action: {
                        currentTab = .Messages
                    }){
                        Image(systemName: currentTab == .Messages ? "envelope.fill" : "envelope")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .foregroundColor( currentTab == .Messages ? .primaryColor : .gray.opacity(0.4))
                            .padding(.vertical, 0.02)
                    }//End of Button
                }//End of VStack
                
                Spacer()
                
            }//End of HStack
            
        }//End of VSTack
        .padding(.bottom, 10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .environmentObject(SideMenuData())
    }
}
