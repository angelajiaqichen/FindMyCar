//
//  ViewController.swift
//  FindMyCar
//
//  Created by Angela Chen on 11/2/22.
//  Copyright © 2022 Steph K. Ananth. All rights reserved.
//

import Foundation

class ViewController {
  let userLocation: Location = Location()
  let carLocation: Location = Location()
  
  func generateTitle() -> String {
    let message = "Your car is currently at:\n(\(self.carLocation.latitude), \(self.carLocation.longitude))"
    return message
  }

  func generateMessage() -> String {
    let message = "\nWhen you want to map to this location, simply press the \"Where is my car?\" button."
    return message
  }
  
}
