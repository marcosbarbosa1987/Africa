//
//  VideoListView.swift
//  Africa
//
//  Created by Marcos Barbosa on 13/02/21.
//

import SwiftUI

struct VideoListView: View {
    
    // MARK: - Properties
    
    @State var videos: [Video] = Bundle.main.decode("videos.json")
    let hepticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { video in
                    NavigationLink(destination: VideoPlayerView(videoSelected: video.id, videoTitle: video.name)) {
                        VideoListItemView(video: video)
                            .padding(.vertical, 8)
                    }
                }//: Loop
            }//: List
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Video", displayMode: .inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // Shuffle videos
                        videos.shuffle()
                        hepticImpact.impactOccurred()
                    }) {
                        Image(systemName: "arrow.2.squarepath")
                    }
                }
            }
        }//: Navigation
    }
}

// MARK: - Preview

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
