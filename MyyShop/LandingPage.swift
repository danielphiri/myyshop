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
                .multilineTextAlignment(.center)
              signUpButton
                .padding(.horizontal, 40)
                .padding(.top, 50)
            }
            .frame(width: UIScreen.main.bounds.width)
          }
          .frame(height: UIScreen.main.bounds.height * 0.5)
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
  
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
    }
}
