//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Yekan Ji on 6/22/21.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        // Create an instance of data service and get the data
        self.recipes = DataService.getLocalData()
    }
    
    static func getPortion(ingredient:Ingredient, recipeServings:Int, targetServings: Int) -> String {
        
        var portion = " "
        var wholePortions = 0
        
        // Make numerator/denominator equal to 1 if the ingredient object has the variables num/denom but assign the value to nil
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        
        // Avoid all ingredient objects that do NOT have the num/denom property
        if ingredient.num != nil {
            
            denominator *= recipeServings
            numerator *= targetServings
            
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            
            numerator /= divisor
            denominator /= divisor
            
            if numerator >= denominator {
                wholePortions = numerator / denominator
                numerator = numerator % denominator
                
                // Add the whole portion
                portion += String(wholePortions)
            }
            
            // Check if there is fraction portion, if so, append to portion String
            
            if numerator > 0 {
                portion += wholePortions > 0 ? " " : ""
                portion += "\(numerator)/\(denominator)"
            }
        }
        
        if var unit = ingredient.unit {
            
            if wholePortions > 1 {
                
                if unit.suffix(2) == "ch" {
                    unit += "es"
                } else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ies"
                } else {
                    unit += "s"
                }
            }
           
            
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            return portion + unit
        }
        return portion
    }
    
}
