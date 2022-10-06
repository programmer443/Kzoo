//
//  AnimalGridItemView.swift
//  Kzoo
//
//  Created by Muhammad Ahmad on 04/10/2022.
//

import SwiftUI

struct AnimalGridItemView: View {
    //MARK: - PROPERTY
    let animal: Animal
    
    //MARK: - BODY
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

struct AnimalGridItemView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        AnimalGridItemView(animal: animals[0])
    }
}
