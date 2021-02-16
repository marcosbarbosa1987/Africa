//
//  GalleryView.swift
//  Africa
//
//  Created by Marcos Barbosa on 13/02/21.
//

import SwiftUI

struct GalleryView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Text("Gallery")
        }//: ScrollView
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MontionAnimationView())
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
