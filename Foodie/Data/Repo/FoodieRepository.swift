//
//  FoodieRepository.swift
//  Foodie
//
//  Created by Prima Santosa on 20/04/21.
//

import Foundation
import Combine

protocol FoodieRepositoryProtocol {
  func getFoods() -> AnyPublisher<[Foodie], Error>
}

final class FoodieRepository: FoodieRepositoryProtocol {
  fileprivate var dataSource: FoodieDataSource
  
  init(dataSource: FoodieDataSource) {
    self.dataSource = dataSource
  }
  
  static let shared = FoodieRepository(dataSource: FoodieDataSource.shared)
  
  func getFoods() -> AnyPublisher<[Foodie], Error> {
    return self.dataSource.getFoods()
      .map { foodieResponse in
        foodieResponse.map {
          FoodieMapper.mapFoodieResponseToFoodie(from: $0)
        }
      }
      .eraseToAnyPublisher()
  }
}

