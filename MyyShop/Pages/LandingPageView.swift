//
//  LandingPage.swift
//  MyyShop
//
//  Created by Daniel Phiri on 6/18/23.
//

import SwiftUI

struct LandingPageView: View {
  
  var router: Routable
  
  var body: some View {
    ScrollView(showsIndicators: true) {
      LazyVStack {
        ZStack {
          Image("banner-image")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .background(Color.red)
          VStack(alignment: .center, spacing: .defaultSpacing) {
            Text("MyyShop is Your Shop!")
              .font(.largeTitle)
              .foregroundColor(.white)
              .fixedSize(horizontal: false, vertical: true)
            Text("Empowers content creators to monetize their social media presence!")
              .font(.title3)
              .fixedSize(horizontal: false, vertical: true)
              .foregroundColor(.white)
              .multilineTextAlignment(.leading)
            signUpButton
              .padding(.top, .defaultPadding * 2.5)
          }
          .padding(.horizontal, .defaultPadding)
          .frame(width: .screenWidth)
        }
        .frame(height: .screenHeight / 2)
        learnToEarnArea
      }
    }
    .ignoresSafeArea()
  }
  
  
  private var signUpButton: some View {
    Button {
      let signUpController = UIHostingController(rootView: SignUpPageView(router: self.router))
      router.present(controller: signUpController, type: .popUp)
    } label: {
      ZStack {
        RoundedRectangle(cornerRadius: 0)
          .foregroundColor(.white)
        Text("Sign up as Creator")
          .foregroundColor(.black)
          .font(.callout)
      }
      
    }
    .frame(height: 60)
  }
  
  private var learnToEarnArea: some View {
    VStack(alignment: .center, spacing: .defaultSpacing) {
      Text("Learn to Earn")
        .font(.largeTitle)
        .foregroundColor(.black)
        .fixedSize(horizontal: false, vertical: true)
      Text("We believe that anyone can achieve financial success with the proper knowledge and the right mindset. Our mission is to equip you with the tools and platform necessary to make this a breeze!")
        .font(.title3)
        .fixedSize(horizontal: false, vertical: true)
        .foregroundColor(.black)
        .multilineTextAlignment(.leading)
        .padding(.horizontal, 20)
      YouTubeView(videoId: "-Yg1UeGpbS0")
        .frame(width: .screenWidth - .defaultPadding, height: 300)
        .padding()
      learnMoreButton
        .padding(.horizontal, .defaultPadding)
        .padding(.top, .defaultPadding)
    }
    .frame(width: UIScreen.main.bounds.width)
    .padding(.vertical, .defaultPadding)
  }
  
  private var learnMoreButton: some View {
    Button {
#warning("TODO")
    } label: {
      ZStack {
        RoundedRectangle(cornerRadius: 0)
          .foregroundColor(.black)
        Text("Learn More")
          .foregroundColor(.white)
          .font(.callout)
      }
      
    }
    .frame(height: 60)
  }
  
}


