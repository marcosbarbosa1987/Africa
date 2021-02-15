//
//  VideoListItem.swift
//  Africa
//
//  Created by Marcos Barbosa on 15/02/21.
//

import SwiftUI

struct VideoListItemView: View {
    
    // MARK: - Properties
    
    let video: Video
    
    // MARK: - Body
    
    var body: some View {
        
        HStack(spacing: 12) {
            ZStack {
                Image(video.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .cornerRadius(8)
                
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .shadow(radius: 4)
                
            }//: ZStack
            
            VStack(alignment: .leading, spacing: 10) {
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }//: VStack
            
        }//: HStack
    }
}

// MARK: - Preview

struct VideoListItem_Previews: PreviewProvider {
    
    static let videos: [Video] = Bundle.main.decode("videos.json")
    
    static var previews: some View {
        VideoListItemView(video: videos[5])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
