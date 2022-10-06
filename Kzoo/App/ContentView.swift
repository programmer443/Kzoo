//
//  ContentView.swift
//  Kzoo
//
//  Created by Muhammad Ahmad on 27/09/2022.
//

import SwiftUI

struct ContentView: View {
    //MARK: Property
    @State private var isGridLayout: Bool = false
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridCloumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    let animals : [Animal] = Bundle.main.decode("animals.json")
    let haptic = UIImpactFeedbackGenerator(style: .medium)
    
    func gridSwitch(){
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridCloumn = gridLayout.count
        
        //GRID IMAGE
        switch gridCloumn {
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }
    
    //MARK: - Body
    var body: some View {
        NavigationView {
            Group{
                if !isGridLayout {
                    List{
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach(animals) { animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)){
                                AnimalListItemView(animal: animal)
                            }
                        }//: LOOP
                        CreditsView()
                            .modifier(CenterModifier())
                    }//: LIST
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    withAnimation(.easeIn) {
                                        AnimalGridItemView(animal: animal)
                                    }
                                }
                            }//: LOOP
                        }//: GRID
                        .padding(10)
                    }//: SCROLL
                }//: CONDITION
            }//: GROUP
            .navigationBarTitle("Kzoo", displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        //LIST
                        Button {
                            print("List View")
                            isGridLayout = false
                            haptic.impactOccurred()
                        } label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridLayout ? .primary : .accentColor)
                        }
                        //GRID
                        Button {
                            print("Grid")
                            isGridLayout = true
                            haptic.impactOccurred()
                            gridSwitch()
                        } label: {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridLayout ? .accentColor : .primary)
                        }

                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
