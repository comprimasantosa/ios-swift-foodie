//
//  FoodieMapper.swift
//  Foodie
//
//  Created by Prima Santosa on 20/04/21.
//

import Foundation

final class FoodieMapper {
  static func mapFoodieResponseToFoodie(from response: FoodieResponse) -> Foodie {
    return Foodie(
      name: response.name ?? "",
      image: response.image ?? "",
      description: response.description ?? ""
    )
  }
}
