//
//  FoodieService.swift
//  Foodie
//
//  Created by Prima Santosa on 20/04/21.
//

import Foundation

private extension URL {
  private static var baseUrl: String {
    guard let filePath = Bundle.main.path(forResource: "Foodie-Info", ofType: "plist") else {
      fatalError("Couldn't find file 'Foodie-Info.plist'.")
    }
    let plist = NSDictionary(contentsOfFile: filePath)
    guard let value = plist?.object(forKey: "BASE_URL") as? String else {
      fatalError("Couldn't find key 'BASE_URL' in 'Foodie-Info.plist'.")
    }
    return value
  }
  
  static func makeEndpoint(_ endpoint: String) -> URL {
    URL(string: "\(baseUrl)\(endpoint)")!
  }
}

extension URL {
  static func getFoods() -> URL {
    makeEndpoint("foods")
  }
}
