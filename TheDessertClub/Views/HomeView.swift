//
//  ContentView.swift
//  TheDessertClub
//
//  Created by aurel on 09/08/22.
//

import SwiftUI

struct HomeView: View {
    
    @State var meals: Result? = nil
    @State private var isError = false
    
    @State private var showAlert = false
    @State private var err: Error? = nil
    @State private var showAbout = false
    
    init() {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(named: "coffee.darkbrown") ?? UIColor.black]
    }
    
    var body: some View {
        VStack {
            if let meals = meals {
                let mealsData = meals.meals
                List(mealsData, id: \.idMeal) { meal in
                    CustomNavigationLink(destination:  DetailView(idMeal: meal.idMeal)) {
                        MealItemView(meal: meal)
                    }
                    .listStyle(.plain)
                    .listRowBackground(Color.clear)
                    
                }
                .refreshable {
                    self.meals = nil
                    loadMeals()
                   
                }
            } else {
                if isError && meals == nil {
                    VStack {
                        Text(err?.localizedDescription ?? "Fetching error")
                        Button {
                            self.meals = nil
                            loadMeals()
                        } label: {
                            Text("Try Again")
                                .fontWeight(.bold)
                                .foregroundColor(Color.theme.darkbrown)
                        }
                    }
                } else {
                    ProgressView("Finding Recipes ...")
                }
            }
        }
        .task {
            loadMeals()
        }
        .navigationTitle("Dessert Recipes")
        .toolbar {
            Button {
                self.showAbout = true
            } label: {
                Image(systemName: "info.circle.fill")
                    .font(.system(size: 20))
                    .foregroundColor(Color.theme.darkbrown)
            }
        }
        .fullScreenCover(isPresented: $showAbout) {
            AboutView()
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text(err?.localizedDescription ?? "Fetching error"), message: Text("Please check your connection and try again"), dismissButton: .default(Text("Got it!")))
        }
    }
    
    private func loadMeals() {
        ApiMeal().loadMeals { error, result in
            if let result = result {
                self.meals = result
                self.isError = false
            }
            if let err = error {
                self.showAlert = true
                self.isError = true
                self.err = err
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
