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
    
    var body: some View {
        
        TextField("Phone, email, username", text: $email)
        
        TextField("Password", text: $passowrd)
            .textFieldStyle(RoundedBorderTextFieldStyle())
        
    }
}

struct Authentication_Previews: PreviewProvider {
    static var previews: some View {
        Authentication()
    }
}


struct BlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color(red: 0, green: 0, blue: 0.5))
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
}
