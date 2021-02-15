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
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            List {
                CoverImageView()
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .padding(.bottom, 16)
                
                ForEach(animals) { animal in
                    NavigationLink(destination: AnimalDetailView(animal: animal)) {
                        AnimalListItemView(animal: animal)
                    }
                }
                
            }//: List
            .navigationBarTitle("Africa", displayMode: .large)
            
        }//: NavigationView
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
