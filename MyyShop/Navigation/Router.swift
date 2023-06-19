//
//  Router.swift
//  MyyShop
//
//  Created by Daniel Phiri on 6/19/23.
//

import UIKit

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
