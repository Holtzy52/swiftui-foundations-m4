//
//  RecipeHighlights.swift
//  Recipe List App
//
//  Created by Flynn Holthouse on 19/10/21.
//

import SwiftUI

struct RecipeHighlights: View {
    
    var allHighlights = ""
    
    init(highlights:[String]) {
        for index in 0..<highlights.count {
            
            // if this is the last item do not add a comma
            if index == highlights.count-1 {
                allHighlights += highlights[index]
            }
            else {
                allHighlights += highlights[index] + ", "
            }
            
        }
    }
    
    var body: some View {
        Text(allHighlights)
            .font(Font.custom("Avenir", size: 15))
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(highlights: ["test 1", "test 2", "test 3"])
    }
}
