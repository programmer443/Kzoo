//
//  CoverImageView.swift
//  Kzoo
//
//  Created by Muhammad Ahmad on 27/09/2022.
//

import SwiftUI

struct CoverImageView: View {
    // Mark:- Property
    
    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
    
    // Mark:- Body
    
    var body: some View {
        TabView {
            ForEach(coverImages){ item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
    }
}
