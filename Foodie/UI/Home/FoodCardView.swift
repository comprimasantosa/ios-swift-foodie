//
//  FoodCardView.swift
//  Foodie
//
//  Created by Prima Santosa on 20/04/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct FoodCardView: View {
  let foodie: Foodie
  
  var body: some View {
    ZStack {
      WebImage(url: URL(string: foodie.image), options: .allowInvalidSSLCertificates)
        .resizable()
        .frame(alignment: .center)
      LinearGradient(
        gradient: Gradient(
          colors: [Color.black.opacity(0.3), Color.black.opacity(0.5)]
        ),
        startPoint: .top,
        endPoint: .bottom
      )
      VStack {
        HStack {
          Text(foodie.name)
            .font(.system(size: 52.0))
            .foregroundColor(.white)
            .bold()
          Spacer()
        }
        .padding()
        Spacer()
      }
    }
    .frame(height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    .cornerRadius(16.0)
    .shadow(radius: 16.0)
    .padding()
  }
}

struct FoodCardView_Previews: PreviewProvider {
  static var previews: some View {
    FoodCardView(
      foodie: Foodie(
        name: "Capcay Hidup Hidup",
        image: "https://cintaihidup.com/wp-content/uploads/2017/03/capcay.jpg", description: ""
      )
    )
  }
}

