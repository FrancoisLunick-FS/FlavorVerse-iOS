//
//  RecipeModel.swift
//  FlavorVerse
//
//  Created by Lunick Francois on 8/31/23.
//

import Foundation

enum Category: String {
    case breakfast = "Breakfast"
    case lunch = "Lunch"
    case dinner = "Dinner"
}

class RecipeModel: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let description: String
    let ingredients: String
    let directions: String
    let category: Category
    let datePublished: String
    let url: String
    
}
