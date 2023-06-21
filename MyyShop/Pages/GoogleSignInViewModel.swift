//
//  GoogleSignInViewModel.swift
//  MyyShop
//
//  Created by Daniel Phiri on 6/20/23.
//

import Foundation
import FirebaseCore
import GoogleSignIn
import FirebaseAuth

final class GoogleSignInViewModel: ObservableObject {
  
  func signIn(controller: UIViewController) {
    guard let clientID = FirebaseApp.app()?.options.clientID else { return }
    
    // Create Google Sign In configuration object.
    let config = GIDConfiguration(clientID: clientID)
    GIDSignIn.sharedInstance.configuration = config
    
    // Start the sign in flow!
    GIDSignIn.sharedInstance.signIn(withPresenting: controller) { [unowned self] result, error in
      guard error == nil else {
        
        fatalError("Something went wrong")
      }
      
      guard let user = result?.user,
            let idToken = user.idToken?.tokenString
      else {
        fatalError("Something went wrong")
      }
      
      let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                     accessToken: user.accessToken.tokenString)
      
      // ...
      Auth.auth().signIn(with: credential) { result, error in
        print("Signed in")
        // At this point, our user is signed in
      }
      
    }
  }
  
}
