//
//  HomeView.swift
//  Foodie
//
//  Created by Prima Santosa on 20/04/21.
//

import SwiftUI

struct HomeView: View {
  @StateObject var viewModel: HomeViewModel
  
  var body: some View {
    NavigationView {
      VStack {
        if !viewModel.foodsData.isEmpty {
          ScrollView {
            LazyVStack {
              ForEach(viewModel.foodsData) { food in
                NavigationLink(
                  destination: DetailView(foodie: food),
                  label: {
                    FoodCardView(foodie: food)
                  })
              }
            }
          }
        }
      }
      .navigationBarTitle("Foodie")
    }
    .onAppear(perform: {
      viewModel.getFoods()
    })
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView(viewModel: HomeViewModel(repository: FoodieRepository.shared)
    )
  }
}

