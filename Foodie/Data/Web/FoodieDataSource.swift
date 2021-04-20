//
//  FoodieDataSource.swift
//  Foodie
//
//  Created by Prima Santosa on 20/04/21.
//

import Foundation
import Combine
import Alamofire

protocol FoodieDataSourceProtocol {
  func getFoods() -> AnyPublisher<[FoodieResponse], Error>
}

final class FoodieDataSource: FoodieDataSourceProtocol {
  private init() {}
  static let shared = FoodieDataSource()
  
  func getFoods() -> AnyPublisher<[FoodieResponse], Error> {
    return Future<[FoodieResponse], Error> { completion in
      AF.request(URL.getFoods())
        .validate()
        .responseDecodable(of: [FoodieResponse].self) { response in
          switch response.result {
          case .success(let value):
            completion(.success(value))
          case .failure(let error):
            completion(.failure(error))
          }
        }
    }
    .eraseToAnyPublisher()
  }
}
