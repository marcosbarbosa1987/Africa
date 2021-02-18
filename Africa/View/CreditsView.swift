//
//  CreditsView.swift
//  Africa
//
//  Created by Marcos Barbosa on 17/02/21.
//

import SwiftUI

struct CreditsView: View {
    
    // MARK: - Properties
    
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 124, height: 128)
                
            
            Text("""
    Copyright © Robert Petras
    All right reserved
    Developed by Marcos Barbosa
    Better Apps ♡ Less Code
    """)
                .font(.footnote)
                .multilineTextAlignment(.center)
        }//: VStack
        .padding()
        .opacity(0.4)
    }
}

// MARK: - Preview

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
