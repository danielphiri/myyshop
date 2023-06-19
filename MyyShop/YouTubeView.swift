//
//  YouTubeView.swift
//  MyyShop
//
//  Created by Daniel Phiri on 6/19/23.
//

import WebKit
import SwiftUI


/*
 
 Credit: https://www.hackingwithswift.com/forums/swiftui/how-to-play-a-youtube-video-in-swiftui/16467
 
 */

struct YouTubeView: UIViewRepresentable {
  
  let videoId: String
  
  func makeUIView(context: Context) ->  WKWebView {
    return WKWebView()
  }
  
  func updateUIView(_ uiView: WKWebView, context: Context) {
    guard let demoURL = URL(string: "https://www.youtube.com/embed/\(videoId)") else { return }
    uiView.scrollView.isScrollEnabled = false
    uiView.load(URLRequest(url: demoURL))
  }
  
}

struct LandingPage_Previews: PreviewProvider {
  
  static var previews: some View {
    LandingPage(router: Router())
  }
  
}

