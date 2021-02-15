//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Marcos Barbosa on 15/02/21.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    
    // MARK: - Properteis
    
    var videoSelected: String
    var videoTitle: String
    
    // MARK: - Body
    
    var body: some View {
        let video = playVideo(fileName: videoSelected, fileFormat: "mp4")
        if video != nil {
            VStack {
                VideoPlayer(player: video)
                .overlay(
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                        .padding(.top, 6)
                        .padding(.horizontal, 8)
                    , alignment: .topLeading
                )
            }//: VStack
            .accentColor(.accentColor)
            .navigationBarTitle(videoTitle, displayMode: .inline)
        }
    }
}

// MARK: - Preview

struct VideoPlayerView_Previews: PreviewProvider {
    static let videos: [Video] = Bundle.main.decode("videos.json")
    
    static var previews: some View {
        NavigationView {
            VideoPlayerView(videoSelected: videos[9].id, videoTitle: videos[0].name)
        }
    }
}
