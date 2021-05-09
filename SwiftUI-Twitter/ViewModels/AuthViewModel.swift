//
//  AuthViewModel.swift
//  SwiftUI-Twitter
//
//  Created by Adam on 5/9/21.
//

import Foundation
import Firebase

class AuthViewModel: ObservableObject {
    //
    let auth = Auth.auth()
    
    func signUp(email: String, password: String) {
        auth.createUser(withEmail: email, password: password)
//        { authResult, errors in
//            if let error = errors{
//                print(error.localizedDescription)
//            }else{
//                authResult
//            }
//        }
    }
}
