//
//  DetailView.swift
//  Foodie
//
//  Created by Prima Santosa on 20/04/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {
  let foodie: Foodie
  
  var body: some View {
    ScrollView {
      VStack(alignment: .leading) {
        WebImage(url: URL(string: foodie.image), options: .allowInvalidSSLCertificates)
          .resizable()
          .frame(height: 300, alignment: .center)
        VStack(alignment: .leading) {
          Text(foodie.name)
            .font(.title2)
            .bold()
            .padding(.bottom, 16)
          Text("Cara memasak:")
            .font(.headline)
            .padding(.bottom, 2)
          Text(foodie.description)
            .font(.body)
        }
        .padding(.horizontal, 16)
      }
      .navigationBarTitle("Food Detail", displayMode: .inline)
    }
  }
}

struct DetailView_Previews: PreviewProvider {
  static var previews: some View {
    DetailView(foodie: Foodie(
                name: "Capcay Hidup Hidup",
                image: "https://cintaihidup.com/wp-content/uploads/2017/03/capcay.jpg", description: "")
    )
  }
}


