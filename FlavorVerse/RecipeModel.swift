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
    let category: Category.RawValue
    let datePublished: String
    let url: String
    
    init(name: String, image: String, description: String, ingredients: String, directions: String, category: Category.RawValue, datePublished: String, url: String) {
        self.name = name
        self.image = image
        self.description = description
        self.ingredients = ingredients
        self.directions = directions
        self.category = category
        self.datePublished = datePublished
        self.url = url
    }
    
}

extension RecipeModel {
    static let recipes: [RecipeModel] =
    [
        RecipeModel(name: "Test", image: "test.jpg", description: "this is a test", ingredients: "testing", directions: "test", category: "Lunch", datePublished: "9/9/2023", url: "test.com")
    ]
}
