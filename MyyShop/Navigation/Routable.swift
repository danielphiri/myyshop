//
//  Routable.swift
//  MyyShop
//
//  Created by Daniel Phiri on 6/19/23.
//

import UIKit

protocol Routable {
  
  func initalize(initialController: UIViewController, window: UIWindow)
  
  func present(controller: UIViewController, type: PresentationType)
  
  func dismiss(type: PresentationType)
  
}
