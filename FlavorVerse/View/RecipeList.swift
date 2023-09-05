//
//  RecipeList.swift
//  FlavorVerse
//
//  Created by Lunick Francois on 9/4/23.
//

import SwiftUI

struct RecipeList: View {
    var recipes: [RecipeModel]
    var body: some View {
        
        VStack {
            Text("Your Recipes are below")
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
                
                ForEach(recipes) { recipe in
                    RecipeCardView(recipeModel: recipe)
                }
            } .padding(.top)
                
            
        } .padding(.horizontal)
    }
}

struct RecipeList_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            RecipeList(recipes: RecipeModel.recipes)
        }
        
    }
}
