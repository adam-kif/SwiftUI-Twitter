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
    
    @State private var showErrorEmail = false
    
    @State private var showErrorPassword = false
    
    @StateObject var authVM = AuthViewModel()
    
    //    init() {
    //        UITableView.appearance().backgroundColor = .clear
    //        UITableView.appearance().tableFooterView = UIView()
    //        UITableView.appearance().separatorColor = .clear
    //        UITableView.appearance().separatorStyle = .none
    //        UITableView.appearance().showsVerticalScrollIndicator = false
    //    }
    
    var body: some View {
        
        ScrollView(showsIndicators: false){
            VStack(spacing: 20){
                
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
                VStack {
                    TextField("Phone, email, userName", text: $email)
                        .foregroundColor(.black.opacity(0.8))
                        .font(.system(size: 18))
                        .padding(.vertical, 14)
                        .padding(.horizontal, 10)
                        .cornerRadius(5)
                        .overlay(
                            Rectangle()
                                .frame(width: nil, height: 2, alignment: .bottom)
                                .foregroundColor(.primaryColor), alignment: .bottom)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                        .onChange(of: email) { _ in
                            showErrorEmail = false
                        }
                    
                    if showErrorEmail {
                        Text("Please enter a valid email.")
                            .font(.subheadline)
                            .foregroundColor(.red)
                            .padding(.leading, 2)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                
                //MARK: - Password
                VStack {
                    SecureField("Password", text: $passowrd)
                        .foregroundColor(.black.opacity(0.8))
                        .font(.system(size: 18))
                        .padding(.vertical, 14)
                        .padding(.horizontal, 10)
                        .cornerRadius(5)
                        .overlay(
                            Rectangle()
                                .frame(width: nil, height: 2, alignment: .bottom)
                                .foregroundColor(.primaryColor), alignment: .bottom)
                        .autocapitalization(.none)
                        .onChange(of: passowrd) { _ in
                            if !passowrd.isEmpty && passowrd.count == 8 {
                                showErrorPassword = false
                            }
                        }
                    
                    if showErrorPassword {
                        Text("Password must be at least 8 characters long.")
                            .font(.subheadline)
                            .foregroundColor(.red)
                            .padding(.leading, 2)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                
                Spacer()
                    .frame(height: 7)
                
                //MARK: - Log In
                Button(action: {
                    if email.isEmpty || passowrd.isEmpty || passowrd.count < 8 {
                        showErrorEmail = true
                        showErrorPassword = true
                        
                    }else if email.isEmpty {
                        
                        showErrorEmail = true
                        
                    }else if passowrd.isEmpty || passowrd.count < 8 {
                        
                        showErrorPassword = true
                        
                    }else{
                        
                        if showSignUp{
                            
                            authVM.signUp(email: email, password: passowrd)
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                            isActive = true
                        }
                    }
                }) {
                    
                    Text(showSignUp ? "Sign Up" : "Log In")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundColor(.white).padding().background(Rectangle().cornerRadius(10).foregroundColor(.primaryColor))
                    
                }//End of Button
                .background(
                    NavigationLink(destination: MainTabView()
                                    .navigationBarBackButtonHidden(true)
                                   , isActive: $isActive){
                        EmptyView()
                    }
                )
                .buttonStyle(PlainButtonStyle())
                
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
                
            }//End of VSTack
            .padding(.horizontal)
            .padding(.top, 40)
            .padding(.bottom, 20)
        }
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

