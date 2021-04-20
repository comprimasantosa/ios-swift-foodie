//
//  FoodieApp.swift
//  Foodie
//
//  Created by Prima Santosa on 20/04/21.
//

import SwiftUI

@main
struct FoodieApp: App {
  var body: some Scene {
    WindowGroup {
      HomeView(viewModel: HomeViewModel(repository: FoodieRepository.shared))
    }
  }
}
