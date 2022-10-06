//
//  AnimalDetailView.swift
//  Kzoo
//
//  Created by Muhammad Ahmad on 27/09/2022.
//

import SwiftUI

struct AnimalDetailView: View {
    //Mark:- Property
    
    let animal: Animal
    
    //Mark:- Body
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y: 24)
                    )
                
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                Group {
                    HeadingView(headerImage: "photo.on.rectangle.angled", headerTitle: "Winderness in Pictures")
                    InsetGalleryView(animal: animal)
                }
                .padding(.horizontal)
                
                Group {
                    HeadingView(headerImage: "questionmark.circle", headerTitle: "Did you know?")
                    InsetFactView(animal: animal)
                }
                .padding(.horizontal)
                
                Group {
                    HeadingView(headerImage: "info.circle", headerTitle: "All about \(animal.name)")
                    
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }
                .padding(.horizontal)
                
                Group{
                    HeadingView(headerImage: "map", headerTitle: "National Parks")
                    InsetMapView()
                }
                .padding(.horizontal)
                
                Group{
                    HeadingView(headerImage: "books.vertical", headerTitle: "Learn more")
                    ExternalWenlinkView(animal: animal)
                }
            }
            .navigationBarTitle("Learn more about \(animal.name)", displayMode: .inline)
        }
    }
}

struct AnimalDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let animals : [Animal] = Bundle.main.decode("animals.json")
        AnimalDetailView(animal: animals[0])
    }
}
