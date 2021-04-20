//
//  FoodieResponse.swift
//  Foodie
//
//  Created by Prima Santosa on 20/04/21.
//

import Foundation

struct FoodieResponse: Codable {
  let name: String?
  let image: String?
  let description: String?
  
  enum CodingKeys: String, CodingKey {
    case name = "name"
    case image = "image"
    case description = "desc"
  }
}
