//
//  HomeViewModel.swift
//  Foodie
//
//  Created by Prima Santosa on 20/04/21.
//

import Foundation

import Foundation
import Combine

class HomeViewModel: ObservableObject {
  private var cancellables: Set<AnyCancellable> = []
  private let repository: FoodieRepositoryProtocol
  
  @Published var foodsData: [Foodie] = []
  @Published var errorMessage = ""
  @Published var isLoading = false
  
  init(repository: FoodieRepositoryProtocol) {
    self.repository = repository
  }
  
  func getFoods() {
    self.errorMessage = ""
    self.isLoading = true
    
    repository.getFoods()
      .receive(on: RunLoop.main)
      .sink(receiveCompletion: { completion in
        switch completion {
        case .failure:
          self.errorMessage = String(describing: completion)
          self.isLoading = false
        case .finished:
          self.isLoading = false
        }
      }, receiveValue: { results in
        self.foodsData = results
      })
      .store(in: &cancellables)
  }
}
