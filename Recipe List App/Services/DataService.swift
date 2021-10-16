//
//  DataService.swift
//  Recipe List App
//
//  Created by Flynn Holthouse on 15/10/21.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe] {
        
        // Parse local json file
        
        // get a url path to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        guard pathString != nil else {
            return [Recipe]()
        }
        
        // create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            // create data object
            let data = try Data(contentsOf: url)
            
            // decode the data with a json decoder
            let decoder = JSONDecoder()
            
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // Add the unique ID's
                for r in recipeData {
                    r.id = UUID()
                }
                
                // return the recipes
                return recipeData
                
            }
            catch {
                // error with decoding
                print(error)
            }
            
            
        }
        catch {
            // error with getting data
            print(error)
        }
        
        return [Recipe]()
        
    }
    
}
