//
//  RecipeCardView.swift
//  FlavorVerse
//
//  Created by Lunick Francois on 8/31/23.
//

import SwiftUI

struct RecipeCardView: View {
    var recipeModel: RecipeModel
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: recipeModel.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .overlay(alignment: .bottom) {
                        Text(recipeModel.name)
                            .font(.headline)
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 3.0)
                            .frame(maxWidth: 136)
                            .padding()
                    }
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40, alignment: .center)
                    .foregroundColor(.white.opacity(0.7))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .overlay(alignment: .bottom) {
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
        RecipeCardView(recipeModel: RecipeModel.init(name: "", image: "", description: "", ingredients: "", directions: "", category: "Ca", datePublished: "", url: ""))
    }
}
