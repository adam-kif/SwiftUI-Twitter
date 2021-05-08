//
//  Authentication.swift
//  SwiftUI-Twitter
//
//  Created by Adam on 5/7/21.
//

import SwiftUI

struct Authentication: View {
    
    @State private var email = ""
    @State private var passowrd = ""
    
    @State private var isActive = false
    
    @State private var showSignUp = false
    
    init() {
        UITableView.appearance().backgroundColor = .clear
        UITableView.appearance().showsVerticalScrollIndicator = false
    }
    
    var body: some View {
        
        Form{
            Section{
                VStack(spacing: 16){
                    
                    //MARK: - Twitter Logo
                    VStack(spacing: 24){
                        Image("twitter-logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60, alignment: .center)
                            .foregroundColor(.primaryColor)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text(showSignUp ? "Create your account" : "Log in to Twitter")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }//End of VSTack
                    
                    Spacer()
                        .frame(height: 10)
                    
                    //MARK: - Email
                    TextField("Phone, email, userName", text: $email)
                        .foregroundColor(.black.opacity(0.8))
                        .font(Font.system(size: 18))
                        .padding(.vertical, 14)
                        .padding(.horizontal, 10)
                        .cornerRadius(5)
                        .overlay(
                            Rectangle()
                                .frame(width: nil, height: 2, alignment: .bottom)
                                .foregroundColor(.primaryColor), alignment: .bottom)
                        .ignoresSafeArea(.keyboard, edges: .bottom)
                    
                    //MARK: - Password
                    SecureField("Password", text: $email)
                        .foregroundColor(.black.opacity(0.8))
                        .font(Font.system(size: 18))
                        .padding(.vertical, 14)
                        .padding(.horizontal, 10)
                        .cornerRadius(5)
                        .overlay(
                            Rectangle()
                                .frame(width: nil, height: 2, alignment: .bottom)
                                .foregroundColor(.primaryColor), alignment: .bottom)
                        .ignoresSafeArea(.keyboard, edges: .bottom)
                    
                    Spacer()
                        .frame(height: 20)
                    
                    //MARK: - Log In
                    Button(action: {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            isActive = true
                        }
                    }) {
                        
                        Text(showSignUp ? "Sign Up" : "Log In")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .foregroundColor(.white).padding().background(Rectangle().cornerRadius(10).foregroundColor(.primaryColor))
                        
                    }//End of Button
                    .padding(.horizontal, 20)
                    .background(
                        NavigationLink(destination: MainTabView()
                                        .navigationBarBackButtonHidden(true)
                                       , isActive: $isActive){
                            EmptyView()
                        }
                        .frame(width: 0)
                        .opacity(0)
                    )
                    .buttonStyle(PlainButtonStyle())
                    
                    Spacer()
                        .frame(height: 2)
                    
                    //MARK: - Sign Up
                    HStack{
                        if !showSignUp{
                            Text("Forgot password? ·")
                        }
                        Text(showSignUp ? "Log in for Twitter" : "Sign up for Twitter")
                            .onTapGesture {
                                showSignUp.toggle()
                            }
                        
                    }//End of HStack
                    .font(.subheadline)
                    .foregroundColor(.primaryColor)
                    
                    Spacer()
                    
                }//End of VSTack
            }//End of Section
            .listRowInsets(EdgeInsets())
        }
        .padding(.top)
        .navigationBarHidden(true)
    }
}

struct Authentication_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            Authentication()
        }
    }
}

