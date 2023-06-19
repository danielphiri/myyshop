//
//  LandingPage.swift
//  MyyShop
//
//  Created by Daniel Phiri on 6/18/23.
//

import SwiftUI

struct LandingPage: View {
    var body: some View {
      ScrollView(showsIndicators: true) {
        LazyVStack {
          ZStack {
            Image("banner-image")
              .resizable()
              .aspectRatio(contentMode: .fill)
              .background(Color.red)
            VStack(alignment: .center, spacing: 20) {
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
                .padding(.horizontal, 40)
                .padding(.top, 50)
            }
            .frame(width: UIScreen.main.bounds.width)
          }
          .frame(height: UIScreen.main.bounds.height * 0.5)
          learnToEarnArea
        }
      }
      .ignoresSafeArea()
    }
  
  
  private var signUpButton: some View {
    Button {
      #warning("TODO")
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
    VStack(alignment: .center, spacing: 20) {
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
        .frame(width: UIScreen.main.bounds.width - 40, height: 300)
        .padding()
      learnMoreButton
        .padding(.horizontal, 40)
        .padding(.top, 20)
    }
    .frame(width: UIScreen.main.bounds.width)
    .padding(.vertical, 40)
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

