//
//  RecipeDetialView.swift
//  Recipe List App
//
//  Created by Yekan Ji on 6/23/21.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe: Recipe
    
    var body: some View {
        
        ScrollView {
            
            VStack (alignment: .leading) {
                // Make: Recipe Name
                
                // Mark: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // Mark: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding([.bottom, .top], 5)
                    
                    ForEach(recipe.ingredients) { item in
                        Text("· " + item.name)
                            .padding(.bottom, 1)
                    }
                }
                .padding(.horizontal)
                
                // Make: Divider
                Divider()
                
                // Mark: Directions
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding([.bottom, .top], 5)
                    
                    ForEach(0..<recipe.directions.count, id: \.self) { idx in
                        Text(String(idx + 1) + ". " + recipe.directions[idx])
                            .padding(.bottom, 1)
                        
                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationBarTitle(recipe.name)
    }
}

struct RecipeDetialView_Previews: PreviewProvider {
    static var previews: some View {
        
        // Create a dummy recipe and pass it  into the detail view so that we can see a preview
        
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
