//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Marcos Barbosa on 14/02/21.
//

import SwiftUI

struct AnimalDetailView: View {
    
    // MARK: - Properties
    
    let animal: Animal
    
    // MARK: - Body
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack(alignment: .center, spacing: 20) {
                
                // MARK: - Hero Image
                
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                
                // MARK: - Title
                
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
                
                // MARK: - Headline
                
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                // MARK: - Gallery
                
                Group {
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
                    InsetGalleryView(animal: animal)
                }//: Group
                .padding(.horizontal)
                
                // MARK: - Facts
                
                // MARK: - Description
                
                // MARK: - Map
                
                // MARK: - Link
                
            }//: VStack
            .navigationBarTitle("Learn about \(animal.name)", displayMode: .inline)
        })//: ScrollView
    }
}

// MARK: - Preview

struct AnimalDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let animals: [Animal] = Bundle.main.decode("animals.json")
        
        NavigationView {
            AnimalDetailView(animal: animals[1])
        }
    }
}
