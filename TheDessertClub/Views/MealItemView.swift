//
//  MealItemView.swift
//  TheDessertClub
//
//  Created by aurel on 09/08/22.
//

import SwiftUI

struct MealItemView: View {
    var meal: Meal
    var body: some View {
        VStack {
            HStack {
                AsyncImage(url: URL(string: meal.strMealThumb)) { phase in
                    if let image = phase.image {
                          image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                      } else if phase.error != nil {
                          Image(systemName: "photo")
                              .imageScale(.large)
                              .foregroundColor(.gray)
                      } else {
                          ProgressView()
                      }
                }
                .frame(width: 100, height: 100)
                .cornerRadius(6)
                
                Text(meal.strMeal)
                    .font(.headline)
                    .padding(.leading)
                Spacer()
            }
            .padding(5)
            .foregroundColor(Color.theme.darkbrown)
            .cornerRadius(18)
            
        }
        .frame(maxWidth: .infinity)
    }
}

struct MealItemView_Previews: PreviewProvider {
    static var previews: some View {
        MealItemView(meal: Meal(strMeal: "Cupcake", strMealThumb: "https://images.unsplash.com/photo-1614707267537-b85aaf00c4b7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1587&q=80", idMeal: "3224"))
    }
}
