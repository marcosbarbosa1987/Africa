//
//  MainView.swift
//  Africa
//
//  Created by Marcos Barbosa on 13/02/21.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            
            // MARK: - First tab
            
            HomeView()
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Browse")
                }
            
            // MARK: - Second tab
            
            VideoListView()
                .tabItem {
                    Image(systemName: "play.rectangle")
                    Text("Watch")
                }
            
            // MARK: - Third tab
            
            MapView()
                .tabItem {
                    Image(systemName: "map")
                    Text("Locations")
                }
            
            // MARK: - Fourth tab
            
            GalleryView()
                .tabItem {
                    Image(systemName: "photo")
                    Text("Gallery")
                }
            
            
        }//: TabView
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
