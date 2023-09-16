//
//  RecipeList.swift
//  FlavorVerse
//
//  Created by Lunick Francois on 9/4/23.
//

import SwiftUI

struct RecipeList: View {
    var recipes: [RecipeModel]
    var category: Category
    var body: some View {
        
        VStack {
            HStack {
                Text(category.rawValue)
                    .font(.title.bold())
                    .padding(.vertical)
                
                Spacer()
            }
            
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
            RecipeList(recipes: [RecipeModel(name: "", image: "", description: "", ingredients: "", directions: "", category: "", datePublished: "", url: "")], category: .breakfast)
        }
        
    }
}
