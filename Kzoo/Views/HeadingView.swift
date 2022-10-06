//
//  HeadingView.swift
//  Kzoo
//
//  Created by Muhammad Ahmad on 27/09/2022.
//

import SwiftUI

struct HeadingView: View {
    //Mark:- Property
    var headerImage: String
    var headerTitle: String
    
    //Mark:- Body
    var body: some View {
        HStack{
            Image(systemName: headerImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            
            Text(headerTitle)
                .font(.title3)
                .fontWeight(.bold)
        }
        .padding(.vertical)
    }
}

struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView(headerImage: "", headerTitle: "Wilderness in Pictures")
    }
}
