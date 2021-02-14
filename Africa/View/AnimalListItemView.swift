//
//  AnimalListItemView.swift
//  Africa
//
//  Created by Marcos Barbosa on 14/02/21.
//

import SwiftUI

struct AnimalListItemView: View {
    
    // MARK: - Properties
    
    var animal: Animal
    
    // MARK: - Body
    
    var body: some View {
        HStack(alignment: .center, spacing: 16, content: {
            Image(animal.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(
                    RoundedRectangle(cornerRadius: 12)
                )
            
            VStack(alignment: .leading, spacing: 8, content: {
                Text(animal.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                
                Text(animal.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.trailing, 8)
            })//: VStack
            
        })//: HStack
    }
}

// MARK: - Preview

struct AnimalListItemView_Previews: PreviewProvider {
    
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        AnimalListItemView(animal: AnimalListItemView_Previews.animals[2])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
