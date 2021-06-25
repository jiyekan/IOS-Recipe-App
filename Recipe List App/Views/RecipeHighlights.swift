//
//  RecipeHighlights.swift
//  Recipe List App
//
//  Created by Yekan Ji on 6/25/21.
//

import SwiftUI

struct RecipeHighlights: View {
    
    var allHighlights = ""
    
    init(highlights:[String]) {
        for idx in 0 ..< highlights.count {
            
            if idx == highlights.count - 1 {
                allHighlights += highlights[idx]
            } else {
                allHighlights += highlights[idx] + ", "
            }
        }
    }
    var body: some View {
        Text(allHighlights)
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(highlights: ["text1", "text2"])
    }
}
