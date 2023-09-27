//
//  MealSection.swift
//  FlavorVerse
//
//  Created by Lunick Francois on 9/15/23.
//
//  Description: This file contains the meal section view for the FlavorVerse app.
//  The meal section view displays a list of meal items within a specific recipe category.
//
//  You are welcome to use, modify, and distribute this code under the terms of the MIT license.
//  Please retain this header in all copies of the code.
//
//  Note: This view is part of the FlavorVerse app, which is designed for recipe exploration and cooking.
//


import SwiftUI

struct MealSection: View {
    let category: Category
    @Binding var currentCategory: Category
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text(category.rawValue)
                .font(.title.bold())
                .padding(.vertical)
            
            ForEach(category.categories) { mealItem in
                HStack(spacing: 16) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(mealItem.name)
                            .font(.title3.bold())
                        
                        Text(mealItem.description)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                        
                    AsyncImage(url: URL(string: mealItem.image)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 96, height: 88)
                            .clipped()
                            .cornerRadius(10)
                    } placeholder: {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40, alignment: .center)
                            .foregroundColor(.white.opacity(0.7))
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            
                    }
                }
                .padding(.horizontal)
                
                Divider()
                
            }
        }
        .modifier(OffsetModifier(category: category, currentCategory: $currentCategory))
    }
}

//struct MealSection_Previews: PreviewProvider {
//    static var previews: some View {
//        MealSection(category: .breakfast)
//    }
//}
