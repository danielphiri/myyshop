//
//  SignUpPage.swift
//  MyyShop
//
//  Created by Daniel Phiri on 6/19/23.
//

import SwiftUI

struct SignUpPageView: View {
  
  let router: Routable
  
  @State var email = ""
  @State var emailColor: Color = .gray
  
  @StateObject var viewModel = GoogleSignInViewModel()
  
  var body: some View {
    ZStack {
      Color.black.opacity(0.5)
      RoundedRectangle(cornerRadius: 0)
        .foregroundColor(.white)
        .frame(width: .screenWidth * 0.8, height: .screenHeight * 0.65)
        .overlay(signUpContent)
    }
    .ignoresSafeArea()
    .frame(width: .screenWidth, height: .screenHeight)
    .onChange(of: email, perform: { newValue in
      if newValue != "" {
        emailColor = .teal
      } else {
        emailColor = .gray
      }
    })
  }
  
  
  private var signUpContent: some View {
    VStack(alignment: .leading, spacing: .defaultSpacing * 2) {
      HStack {
        Button() {
          #warning("TODO")
        } label: {
          Image("logo")
            .resizable()
            .frame(width: 130, height: 40)
        }
        Spacer()
        Button() {
          self.router.dismiss(type: .popUp)
        } label: {
          Image(systemName: "xmark")
            .resizable()
            .frame(width: 15, height: 15)
            .foregroundColor(.gray)
        }
      }
      Text("You're 2 minutes away from building your own storefront.")
        .foregroundColor(.black)
      emailTextField
      getStartedButton
      logInView
      oauthOptions
      Spacer()
    }
    .padding(.all, .defaultPadding)
  }
  
  private var emailTextField: some View {
    Group {
      VStack(alignment: .leading) {
        Text("Your Email")
          .foregroundColor(.black)
          .font(.title3)
        RoundedRectangle(cornerRadius: 5)
          .stroke(lineWidth: email == "" ? 1: 3)
          .foregroundColor(emailColor)
          .frame(height: 50)
          .overlay(
            TextField("Email", text: $email)
              .padding(.all, .defaultPadding/2)
          )
      }
      
    }
  }
  
  private var getStartedButton: some View {
    Button {
      #warning("TODO")
    } label: {
      ZStack {
        RoundedRectangle(cornerRadius: 5)
          .foregroundColor(.teal)
        Text("Get Started")
          .foregroundColor(.white)
          .font(.callout)
      }
      
    }
    .frame(height: 60)
  }
  
  private var logInView: some View {
    HStack {
      Spacer()
      Text("Already have account?")
      Button() {
        #warning("TODO")
      } label: {
        Text("Log in")
          .foregroundColor(.teal)
      }
      Spacer()
    }
  }
  
  private var oauthOptions: some View {
    VStack {
      HStack {
        RoundedRectangle(cornerRadius: 1)
          .foregroundColor(.gray)
          .frame(width: .screenWidth * 0.17, height: 1)
        Spacer()
        Text("Or continue with")
          .foregroundColor(.gray)
        Spacer()
        RoundedRectangle(cornerRadius: 1)
          .foregroundColor(.gray)
          .frame(width: .screenWidth * 0.17, height: 1)
      }
      HStack(spacing: .defaultSpacing) {
        Spacer()
        Button() {
        } label: {
          RoundedRectangle(cornerRadius: 20)
            .stroke(lineWidth: 1)
            .foregroundColor(.gray)
            .overlay(
              Image("google-logo")
                .resizable()
            )
        }
        .frame(width: 40, height: 40)
        Button() {
#warning("TODO")
        } label: {
          RoundedRectangle(cornerRadius: 20)
            .stroke(lineWidth: 1)
            .foregroundColor(.gray)
            .overlay(
              Image("facebook-logo")
                .resizable()
                .padding(.all, 5)
            )
        }
        .frame(width: 40, height: 40)
        Spacer()
      }
    }
  }
  
}

struct SignUpPage_Previews: PreviewProvider {
  static var previews: some View {
    SignUpPageView(router: Router())
  }
}

