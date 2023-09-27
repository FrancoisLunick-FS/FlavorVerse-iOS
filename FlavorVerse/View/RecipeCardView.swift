//
//  RecipeCardView.swift
//  FlavorVerse
//
//  Created by Lunick Francois on 8/31/23.
//
//  Description: This file contains the recipe card view for the FlavorVerse app.
//  The recipe card view displays a recipe's image, name, and other details in a card-like format.
//
//  You are welcome to use, modify, and distribute this code under the terms of the MIT license.
//  Please retain this header in all copies of the code.
//
//  Git Repository: https://github.com/FrancoisLunick-FS/FlavorVerse-iOS
//
//  Note: This view is part of the FlavorVerse app, which is designed for recipe exploration and cooking.
//


import SwiftUI

struct RecipeCardView: View {
    
    // MARK: - Properties
    
    // Recipe model containing recipe details
    var recipeModel: RecipeModel
    
    // MARK: - Body
    var body: some View {
        VStack {
            // AsyncImage to load and display the recipe image
            AsyncImage(url: URL(string: recipeModel.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .overlay(alignment: .bottom) {
                        // Recipe name displayed as a headline
                        Text(recipeModel.name)
                            .font(.headline)
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 3.0)
                            .frame(maxWidth: 136)
                            .padding()
                    }
            } placeholder: {
                // Placeholder image in case the recipe image is not available
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40, alignment: .center)
                    .foregroundColor(.white.opacity(0.7))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .overlay(alignment: .bottom) {
                        // Recipe name displayed as a headline on the placeholder
                        Text(recipeModel.name)
                            .font(.headline)
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 3.0)
                            .frame(maxWidth: 136)
                            .padding()
                    }
            }
        } .frame(width: 160.0, height: 217.0, alignment: .top)
            .background(LinearGradient(gradient: Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)]), startPoint: .top, endPoint: .bottom))
            .clipShape(RoundedRectangle(cornerRadius: 20.0))
            .shadow(color: Color(.black).opacity(0.3), radius: 15, x: 0, y: 10)
    }
}

struct RecipeCardView_Previews: PreviewProvider {
    static var previews: some View {
        // Example usage of RecipeCardView with a sample RecipeModel
        RecipeCardView(recipeModel: RecipeModel.init(name: "", image: "", description: "", ingredients: "", directions: "", category: "Ca", datePublished: "", url: ""))
    }
}
