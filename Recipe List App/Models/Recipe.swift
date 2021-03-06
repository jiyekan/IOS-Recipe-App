//
//  Recipe.swift
//  Recipe List App
//
//  Created by Yekan Ji on 6/22/21.
//

import Foundation

class Recipe: Identifiable, Decodable {
    
    // An unique id for each objects
    // Make it optional data because we need to modify it later
    var id: UUID?
    
    var name: String
    var featured: Bool
    var image: String
    var description: String
    var prepTime: String
    var cookTime: String
    var totalTime: String
    var servings: Int
    var highlights: [String]
    var ingredients: [Ingredient]
    var directions: [String]
}

class Ingredient: Identifiable, Decodable {
    var id: UUID?
    var name: String
    var num: Int?
    var denom: Int?
    var unit: String?
}
