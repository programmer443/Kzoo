//
//  CenterModifier.swift
//  Kzoo
//
//  Created by Muhammad Ahmad on 04/10/2022.
//

import SwiftUI


struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack{
            Spacer()
            content
            Spacer()
        }
    }
}
