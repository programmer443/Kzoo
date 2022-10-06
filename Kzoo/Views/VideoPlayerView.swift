//
//  VideoPlayerView.swift
//  Kzoo
//
//  Created by Muhammad Ahmad on 28/09/2022.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    //Mark:- PROPERTY
    let videoSelected: String
    let videoTitle: String
    
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: videoSelected, fileFormat: "mp4")
            )
            .overlay(
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding(.top, 6)
                    .padding(.horizontal, 8)
                , alignment: .topLeading
            )
        }
        .tint(.accentColor)
        .navigationTitle(videoTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerView(videoSelected: "cheeta", videoTitle: "cheeta")
    }
}
