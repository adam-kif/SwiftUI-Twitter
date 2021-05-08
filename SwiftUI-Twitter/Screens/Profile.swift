//
//  Profile.swift
//  SwiftUI-Twitter
//
//  Created by Adam on 5/7/21.
//

import SwiftUI

struct Profile: View {
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack{
            Text("test")
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("login")
            }//End of Button

        }//End of VSTack
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
