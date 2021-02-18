//
//  CenterModifier.swift
//  Africa
//
//  Created by Marcos Barbosa on 17/02/21.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
