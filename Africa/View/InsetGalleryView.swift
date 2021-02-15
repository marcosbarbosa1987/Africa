//
//  InsetGalleryView.swift
//  Africa
//
//  Created by Marcos Barbosa on 14/02/21.
//

import SwiftUI

struct InsetGalleryView: View {
    
    // MARK: - Properties
    
    let animal: Animal
    
    // MARK: - Body
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false, content: {
            HStack(alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(12)
                }//: Loop
            }//: HStack
        })//: ScrollView
    }
}

// MARK: - Preview

struct InsetGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        
        let animals: [Animal] = Bundle.main.decode("animals.json")
        
        InsetGalleryView(animal: animals[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
