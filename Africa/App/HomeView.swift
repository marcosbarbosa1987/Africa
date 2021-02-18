//
//  HomeView.swift
//  Africa
//
//  Created by Marcos Barbosa on 14/02/21.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Properties
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let hapticsFeedback = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    @State private var isGridViewActive: Bool = false
    
    // MARK: - Methods
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        
        // Toolbar Image
        
        switch gridColumn {
        case 1:
            toolbarIcon = "square.grid.2x2"
            
        case 2:
            toolbarIcon = "rectangle.grid.1x2"
            
        case 3:
            toolbarIcon = "square.grid.3x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
        
    }
    
    // MARK: - Body
    
    var body: some View {
        
        
        
        NavigationView {
            
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                            .padding(.bottom, 16)
                        
                        ForEach(animals) { animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                AnimalListItemView(animal: animal)
                            }
                        }//: Loop
                        CreditsView()
                            .modifier(CenterModifier())
                    }//: List
                } else {
                    ScrollView(.vertical) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(
                                    destination: AnimalDetailView(animal: animal),
                                    label: {
                                        AnimalGridItemView(animal: animal)
                                    })//: NavigationLink
                            }//:  Loop
                        }//: LazyVGrid
                        .padding(10)
                        .animation(.easeIn)
                    }//: ScrollView
                }
            }//: Group
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        
                        // List
                        
                        Button(action: {
                            print("List view is activated")
                            isGridViewActive = false
                            hapticsFeedback.impactOccurred()
                        }) {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        
                        // Grid
                        
                        Button(action: {
                            print("Grid view is activated")
                            isGridViewActive = true
                            hapticsFeedback.impactOccurred()
                            gridSwitch()
                        }) {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }
                        
                    }
                }//: HStack
            }//: Toolbar
        }//: NavigationView
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
