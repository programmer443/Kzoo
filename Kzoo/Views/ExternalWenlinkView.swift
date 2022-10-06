//
//  ExternalWenlinkView.swift
//  Kzoo
//
//  Created by Muhammad Ahmad on 27/09/2022.
//

import SwiftUI

struct ExternalWenlinkView: View {
    let animal: Animal
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                Group{
                    Image(systemName: "arrow.up.right.square")
                    Link(animal.name, destination: (URL(string: animal.link)) ?? URL(string: "https://wikipedia.org")!)
                }
                .foregroundColor(.accentColor)
            } //: HStakc
        }
    }
}

struct ExternalWenlinkView_Previews: PreviewProvider {
    static var previews: some View {
        let animals: [Animal] = Bundle.main.decode("animals.json")
        ExternalWenlinkView(animal: animals[0])
    }
}
