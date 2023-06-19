//
//  SceneDelegate.swift
//  MyyShop
//
//  Created by Daniel Phiri on 6/18/23.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  
  var router: Routable?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    guard let windowScene = scene as? UIWindowScene else { return }
    let window = UIWindow(windowScene: windowScene)
    self.router = Router()
    guard let router = self.router else {
      fatalError("Router not initialized")
    }
    let landingPage = UIHostingController(rootView: LandingPage(router: router))
    self.router?.initalize(initialController: landingPage, window: window)
  }

  func sceneDidDisconnect(_ scene: UIScene) {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
  }

  func sceneDidBecomeActive(_ scene: UIScene) {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
  }

  func sceneWillResignActive(_ scene: UIScene) {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
  }

  func sceneWillEnterForeground(_ scene: UIScene) {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
  }

  func sceneDidEnterBackground(_ scene: UIScene) {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
  }


}

final class Router: Routable {
  
  var window: UIWindow?
  var controllers: [UIViewController] = []
  
  init() {
  }
  
  func initalize(initialController: UIViewController, window: UIWindow) {
    self.controllers = [initialController]
    self.window = window
    guard let topController = self.controllers.last else {
      fatalError("Tried initalizing views without any controllers in hierarchy")
    }
    self.window?.rootViewController = topController
    self.window?.makeKeyAndVisible()
  }
  
  func present(controller newController: UIViewController, type: PresentationType) {
    switch type {
    case .popUp:
      guard let topController = controllers.last else {
        fatalError("Presenting pop up controller to an empty list of controllers")
      }
      newController.view.frame = topController.view.frame
      newController.view.backgroundColor = .clear
      topController.view.addSubview(newController.view)
      topController.addChild(newController)
      newController.didMove(toParent: topController)
      controllers.append(newController)
    }
  }
  
  func dismiss(type: PresentationType) {
    switch type {
    case .popUp:
      guard let topController = controllers.popLast() else {
        fatalError("Attempted to remove controller which does not exist in view hierarchy")
      }
      topController.removeFromParent()
      topController.view.removeFromSuperview()
    }
  }
  
  
}

