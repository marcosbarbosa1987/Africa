//
//  ExternalWebLinkView.swift
//  Africa
//
//  Created by Marcos Barbosa on 15/02/21.
//

import SwiftUI

struct ExternalWebLinkView: View {
    
    // MARK: - Properties
    
    let animal: Animal
    
    // MARK: - Body
    
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                    
                    Link(animal.name, destination: URL(string: animal.link) ?? URL(string: "https://wikipedia.org")!)
                }//: Group
                .foregroundColor(.accentColor)
                
            }//: HStack
        }//: GroupBox
    }
}

// MARK: - Preview

struct ExternalWebLinkView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        ExternalWebLinkView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
