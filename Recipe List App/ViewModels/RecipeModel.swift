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
    
}
