//
//  SearchBar.swift
//  SwiftUI-Twitter
//
//  Created by Adam on 5/9/21.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var searchInput: String

    var body: some View {
        HStack {
     
            Image(systemName: "magnifyingglass")
                .imageScale(.large)
                .padding(.leading)
            
            TextField("Search ...", text: $searchInput)
                .padding(.vertical, 10)
            
            //MARK: - Xmark Icon
            if searchInput.count > 0 {
            Image(systemName: "xmark.circle")
                .imageScale(.large)
                .padding(.trailing)
                .onTapGesture {
                    withAnimation {
                        searchInput = ""
                    }
                }
            }
            
        } //End of HSTack
        .frame(maxWidth: 640, alignment: .center)
        .foregroundColor(Color.gray)
        .background(Color.white)
        .cornerRadius(8)
        .padding()
        .frame(height: 50)
        .animation(.easeOut(duration: 0.4))
        .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 5)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchInput: .constant("Search Twitter"))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
