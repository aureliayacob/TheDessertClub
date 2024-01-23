//
//  MealApi.swift
//  TheDessertClub
//
//  Created by aurel on 09/08/22.
//

import Foundation

class ApiMeal : ObservableObject{    
    
    func loadMeals(completion:@escaping (Error?, Result?) -> ()) {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {
            print("Invalid url...")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            let decoder = JSONDecoder()
            if let data = data {
                do {
                let result = try decoder.decode(Result.self, from: data)
                    DispatchQueue.main.async {
                        completion(nil, result)
                    }
                } catch {

                }
                
            } else if let error = error {
                DispatchQueue.main.async {
                    completion(error, nil)
                }
            }
        }.resume()
        
    }
    
    func loadMealDetail(idMeal: String, completion:@escaping (Error?,ResultMealDetail?) -> ()) {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(idMeal)") else {
            print("Invalid url...")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            let decoder = JSONDecoder()
            if let data = data {
                do {
                    let result = try decoder.decode(ResultMealDetail.self, from: data)
                    DispatchQueue.main.async {
                        completion(nil, result)
                    }
                } catch {
                }
            } else if let error = error {
                DispatchQueue.main.async {
                    completion(error, nil)
                }
            }
        }.resume()
        
        
    }
}
