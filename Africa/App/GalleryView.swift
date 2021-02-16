//
//  GalleryView.swift
//  Africa
//
//  Created by Marcos Barbosa on 13/02/21.
//

import SwiftUI

struct GalleryView: View {
    
    // MARK: - Properties
    
    @State private var selectedAnimal: String = "lion"
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let hepticImpact = UIImpactFeedbackGenerator(style: .medium)
    
//    let gridLayout: [GridItem] = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())
//    ]
    
    // Efficient grid definition
    
//    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    // Dynamic gridLayout
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    func gridSwitch() {
        gridLayout = Array(repeating: GridItem(.flexible()), count: Int(gridColumn))
    }
    
    // MARK: - Body
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
                        
            VStack(alignment: .center, spacing: 30) {

                // Image
                
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .padding(.top, 40)
                
                // Slider
                
                Slider(value: $gridColumn, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn, perform: { value in
                        gridSwitch()
                        hepticImpact.impactOccurred()
                    }
                )
                
                // Grid

                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 12) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = item.image
                                hepticImpact.impactOccurred()
                            }
                    }//: Loop
                }//: VStack
                .padding(.horizontal, 10)
                .padding(.vertical, 50)
            }//: LazyVGrid
            .animation(.easeIn)
            .onAppear(perform: {
                gridSwitch()
            })
        }//: ScrollView
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MontionAnimationView())
    }
}

// MARK: - Preview

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
