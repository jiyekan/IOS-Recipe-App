//
//  DataService.swift
//  Recipe List App
//
//  Created by Yekan Ji on 6/22/21.
//

import Foundation

class DataService {
    
    // Make the function STATIC so that when using it, we don't need to create an instance of the class. We can just call the function by its class name
    // e.g DataService.getLocalData instead of DataService().getLocalData
    static func getLocalData() -> [Recipe] {
        
        // Parse local json file
        
        // Get a url path to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        // Check if the path string is not nil, otherwise ...
        guard pathString != nil else {
            return [Recipe]()
        }
        
        // Create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            // Create a data object
            let data = try Data(contentsOf: url)
            
            // Decode the data with a JSON decoder
            let decoder = JSONDecoder()
            
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // Add the unique IDs
                for r in recipeData {
                    r.id = UUID()
                    
                    // Add unique IDs to ingredients
                    for i in r.ingredients {
                        i.id = UUID()
                    }
                }
                // Return the recipes
                return recipeData
            }
            catch {
                print(error)
            }
           
            
        }
        catch {
            // Error with getting data
            print(error)
        }
        return [Recipe]()
    }
}
