//
//  CreditsView.swift
//  Kzoo
//
//  Created by Muhammad Ahmad on 04/10/2022.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack{
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 182, height: 182)
            
            Text("""
                Copyright © Muhammad Ahmad
                All right reserved
                Better UI ♡ Less Code
                """)
            .font(.footnote)
            .multilineTextAlignment(.center)
        }
        .padding()
        .opacity(0.4)
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
