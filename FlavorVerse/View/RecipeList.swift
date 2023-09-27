//
//  RecipeList.swift
//  FlavorVerse
//
//  Created by Lunick Francois on 9/4/23.
//
//  Description: This file contains the recipe list view for the FlavorVerse app.
//  The recipe list view displays a list of recipes based on a specific category.
//
//  You are welcome to use, modify, and distribute this code under the terms of the MIT license.
//  Please retain this header in all copies of the code.
//
//  Note: This view is part of the FlavorVerse app, which is designed for recipe exploration and cooking.
//


import SwiftUI

struct RecipeList: View {
    
    // MARK: - Properties
    
    // Array of RecipeModel containing recipes to display
    var recipes: [RecipeModel]
    
    // Category for which the recipes are displayed
    var category: Category
    
    // MARK: - Body
    var body: some View {
        
        VStack {
            HStack {
                // Display the category name as a title
                Text(category.rawValue)
                    .font(.title.bold())
                    .padding(.vertical)
                
                Spacer()
            }
            
            // Display a grid of recipes using LazyVGrid
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
            // Example usage of RecipeList with a sample RecipeModel and category
            RecipeList(recipes: [RecipeModel(name: "", image: "", description: "", ingredients: "", directions: "", category: "", datePublished: "", url: "")], category: .breakfast)
        }
        
    }
}
