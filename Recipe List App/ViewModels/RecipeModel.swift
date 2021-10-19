//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Flynn Holthouse on 15/10/21.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        // create an instantce of the data service and get the data
        self.recipes = DataService.getLocalData()
        
    }
    
    static func getPortion(ingredient:Ingredient, recipeServings:Int, targetServings:Int) -> String {
        
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        
        if ingredient.num != nil {
            
            // get a single serving size by multiplying the demonitator by the recipe seving
            denominator *= recipeServings
            
            // et target portion by multiplying numerator by target serving
            numerator *= targetServings
            
            // reduce fraction by the greatest comon divisor
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            // get whole portions if numertaor i greater than demonanator
            if numerator >= denominator {
                
                wholePortions = numerator / denominator
                numerator = numerator % denominator
                
                portion += String(wholePortions)
            }
            
            // Express the remainder as a fraction
            if numerator > 0 {
                // assign remainder as fraction string
                portion += wholePortions > 0 ? " " : ""
                portion += "\(numerator)/\(denominator)"
            }
            
            
        }
        
        if var unit = ingredient.unit {
            
            if  wholePortions > 1 {
                
                if unit.suffix(2) == "ch" {
                    unit += "es"
                }
                else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                }
                else {
                    unit += "s"
                }
            }
            // calculate appropriate suffix
            
            
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            
            return portion + unit
            
            
        }
        
        return portion
    }
    
}
