//
//  ContentView.swift
//  BRIC
//
//  Created by Edith Bourke on 11/12/22.
//

import SwiftUI
import AVKit

enum stream: String {
    case bricTV = "https://dacastmmd.mmdlive.lldns.net/dacastmmd/91ac75bb081d440192aaf03c05ad62df/chunklist_b4628000.m3u8"
    case bricFreeSpeech = "https://dacastmmd.mmdlive.lldns.net/dacastmmd/f1544b49283142f5940fcac0ecb29812/chunklist_b4628000.m3u8"
}

struct ContentView: View {
    @State private var player = AVPlayer()
    var body: some View {
        NavigationStack {
            HStack {
                NavigationLink("Play BRIC TV", destination: {
                    VideoPlayer(player: player)
                        .onAppear() {
                            player = AVPlayer(url: URL(string: stream.bricTV.rawValue)!)
                            player.play()
                        }
                        .onDisappear() {
                           player.pause()
                        }
                        .ignoresSafeArea()
                })
                NavigationLink("Play BRIC Free Speech", destination: {
                    VideoPlayer(player: player)
                        .onAppear() {
                            player = AVPlayer(url: URL(string: stream.bricFreeSpeech.rawValue)!)
                            player.play()
                        }
                        .onDisappear() {
                            player.pause()
                        }
                        .ignoresSafeArea()
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
