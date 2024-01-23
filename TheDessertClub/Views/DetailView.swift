//
//  DetailView.swift
//  TheDessertClub
//
//  Created by aurel on 09/08/22.
//

import SwiftUI
import RoundedCorners

struct DetailView: View {
    @State private var isError = false
    @State private var err: Error? = nil
    @State var meal: MealDetail? = nil
    @State private var showAlert = false
    var idMeal: String
    
    var body: some View {
        VStack {
            if let meal = meal {
                HeaderView(meal: meal)
            } else if isError && meal == nil {
                VStack {
                    Text(err?.localizedDescription ?? "Fetching error")
                        .foregroundColor(.white)
                    Button {
                        self.meal = nil
                        loadMealDetail()
                    } label: {
                        Text("Try Again")
                            .fontWeight(.bold)
                            .foregroundColor(Color.theme.black)
                    }
                }
            } else {
                ProgressView("Getting Recipe's Detail ...")
                
            }
        }
        .frame( maxWidth: .infinity,  maxHeight: .infinity)
        .background(Color.theme.brown)
        .task {
            loadMealDetail()
        }
        .alert(isPresented: $showAlert) {
            
            Alert(title: Text(err?.localizedDescription ?? "Fetching error"), message: Text("Please check your connection and try again"), dismissButton: .default(Text("Got it!")))
        }
    }
    private func loadMealDetail() {
        ApiMeal().loadMealDetail(idMeal: idMeal, completion: { error, meal in
            if let meal = meal {
                self.meal = meal.meals[0]
            }
            
            if let err = error {
                self.showAlert = true
                self.isError = true
                self.err = err
            }
        })
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(meal: MealDetail(idMeal: "5529", strMeal: "Cupcake", strInstructions: "Lorem ipsum dolor", strMealThumb: "https://images.unsplash.com/photo-1614707267537-b85aaf00c4b7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1587&q=80", strYoutube: "", strIngredient1: "Lorem", strIngredient2: "Ipsum", strIngredient3: "Dolor", strIngredient4: "Proin", strIngredient5: "Consectetur", strIngredient6: "Morbi", strIngredient7: "Nunc", strIngredient8: "", strIngredient9: "", strIngredient10: "", strMeasure1: "", strMeasure2: "", strMeasure3: "", strMeasure4: "", strMeasure5: "", strMeasure6: "", strMeasure7: "", strMeasure8: "", strMeasure9: "", strMeasure10: ""))
    }
}

struct HeaderView: View {
    var meal: MealDetail
    var body: some View {
        
        VStack {
            VStack {
                HStack {
                    AsyncImage(url: URL(string: meal.strMealThumb)) { phase in
                        if let image = phase.image {
                            
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .overlay(LinearGradient(gradient: Gradient(colors: [Color("coffee.brown"), .clear]), startPoint: .bottom, endPoint: .top))
                            
                        } else if phase.error != nil {
                            
                            ZStack {
                                Color.theme.cream
                                Text("Failed to load image")
                                    .foregroundColor(Color.white)
                            }
                            
                        } else {
                            
                            ProgressView()
                                .foregroundColor(.white)
                                .frame(width: UIScreen.main.bounds.width, height: 300)
                                .background(Color.theme.cream)
                            
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width, height: 300)
                }
                .ignoresSafeArea(.container, edges: .top)
                Spacer()
            }
            .overlay(RecipeContainer(meal: meal), alignment: .top)
        }
    }
}

struct RecipeContainer: View {
    let meal: MealDetail
    var body: some View {
        VStack (spacing: 10){
            Spacer()
                .frame(maxHeight: 150)
            HStack {
                Text(meal.strMeal)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.theme.cream)
                
                Spacer()
            }
            .padding(.bottom, 12)
            .padding(.horizontal, 24)
            
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 10){
                        Text("Ingrediens")
                            .font(.headline)
                        IngrediensView(meal: meal)
                        Spacer()
                            .frame(maxHeight: 10)
                        Text("Instructions")
                            .font(.headline)
                        Text(meal.strInstructions)
                            .font(.subheadline)
                            .lineSpacing(5)
                        
                    }
                    .foregroundColor(Color.theme.black)
                    
                }
                .padding(24)
                .frame(maxWidth: .infinity)
                
            }
            .background(Color.theme.cream)
            .cornerRadius(tl: 24, tr: 24, bl: 0, br: 0)
        }.ignoresSafeArea()
    }
}

struct IngrediensView: View {
    let meal: MealDetail
    var body: some View {
        VStack(alignment: .leading, spacing: 5){
            ExtractedView(measure: meal.strMeasure1, ingredient: meal.strIngredient1)
            ExtractedView(measure: meal.strMeasure2, ingredient: meal.strIngredient2)
            ExtractedView(measure: meal.strMeasure3, ingredient: meal.strIngredient3)
            ExtractedView(measure: meal.strMeasure4, ingredient: meal.strIngredient4)
            ExtractedView(measure: meal.strMeasure5, ingredient: meal.strIngredient5)
            ExtractedView(measure: meal.strMeasure6, ingredient: meal.strIngredient6)
            ExtractedView(measure: meal.strMeasure7, ingredient: meal.strIngredient7)
            ExtractedView(measure: meal.strMeasure8, ingredient: meal.strIngredient8)
            ExtractedView(measure: meal.strMeasure9, ingredient: meal.strIngredient9)
            ExtractedView(measure: meal.strMeasure10, ingredient: meal.strIngredient10)
            
        }.font(.subheadline)
    }
}

struct ExtractedView: View {
    var measure: String
    var ingredient: String
    var body: some View {
        if !measure.isEmpty  && !ingredient.isEmpty {
            HStack {
                Image(systemName: "chevron.right")
                    .foregroundColor(.primary.opacity(0.5))
                HStack(spacing: 5) {
                    Text(measure)
                    Text(ingredient)
                }
            }
        }
    }
}
