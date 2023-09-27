//
//  RecipeModel.swift
//  FlavorVerse
//
//  Created by Lunick Francois on 8/31/23.
//
//  Description: This file contains the data model for recipes in the FlavorVerse app.
//  It defines the structure of a recipe, including its name, image, description, ingredients, directions,
//  category, publication date, and URL.
//
//  You are welcome to use, modify, and distribute this code under the terms of the MIT license.
//  Please retain this header in all copies of the code.
//
//  Note: The FlavorVerse app is designed for recipe exploration and cooking.
//


import Foundation

enum Category: String, CaseIterable {
    case breakfast = "Breakfast"
    case lunch = "Lunch"
    case dinner = "Dinner"
    case dessert = "Dessert"
    
    var categories: [RecipeModel] {
        switch self {
        case .breakfast:
            return breakfastMeal
        case .lunch:
            return lunchMeal
        case .dinner:
            return dinnerMeal
        case .dessert:
            return dessertMeal
        }
    }
}

struct RecipeModel: Identifiable {
    let id = UUID().uuidString
    let name: String
    let image: String
    let description: String
    let ingredients: String
    let directions: String
    let category: Category.RawValue
    let datePublished: String
    let url: String
    
}

var breakfastMeal: [RecipeModel] = [
    .init(name: "Test", image: "https://hips.hearstapps.com/hmg-prod/images/delish-202002-pozole-0392-landscape-pf-1582315071.jpg?crop=1xw:0.8441943127962085xh;center,top&resize=1200:*", description: "this is a test", ingredients: "testing", directions: "test", category: "Lunch", datePublished: "9/9/2023", url: "https://hips.hearstapps.com/hmg-prod/images/delish-202002-pozole-0392-landscape-pf-1582315071.jpg?crop=1xw:0.8441943127962085xh;center,top&resize=1200:*"),
    .init(name: "Test", image: "https://cdn.loveandlemons.com/wp-content/uploads/2020/03/pantry-recipes-2.jpg", description: "this is a test", ingredients: "testing", directions: "test", category: "Lunch", datePublished: "9/9/2023", url: "test.com")
]

var lunchMeal: [RecipeModel] = [
    RecipeModel(name: "Test", image: "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/chorizo-mozarella-gnocchi-bake-cropped-9ab73a3.jpg?quality=90&resize=556,505", description: "this is a test", ingredients: "testing", directions: "test", category: "Lunch", datePublished: "9/9/2023", url: "test.com"),
    RecipeModel(name: "Test", image: "https://assets.bonappetit.com/photos/64e65c62101bebaac94dcf59/4:3/w_1600%2Ch_1200%2Cc_limit/20230822-SEO-ITS-2336.jpg", description: "this is a test", ingredients: "testing", directions: "test", category: "Lunch", datePublished: "9/9/2023", url: "test.com")
]

var dinnerMeal: [RecipeModel] =
[
    RecipeModel(name: "Test", image: "https://www.deliciousmagazine.co.uk/wp-content/uploads/2023/06/2023D111_RUNNERBEANS_CHICKEN_1__-2.jpg", description: "this is a test", ingredients: "testing", directions: "test", category: "Lunch", datePublished: "9/9/2023", url: "test.com"),
    RecipeModel(name: "Test", image: "https://www.halfbakedharvest.com/wp-content/uploads/2021/09/Healthier-Homemade-One-Pot-Hamburger-Helper-4.jpg", description: "this is a test", ingredients: "testing", directions: "test", category: "Lunch", datePublished: "9/9/2023", url: "test.com"),
    RecipeModel(name: "Test", image: "https://www.foodandwine.com/thmb/tAS-x_IC4ss1cb9EdDpsr0UExdM=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/bucatini-with-mushroom-ragu-dandelion-greens-and-tarragon-FT-RECIPE0421-3a5f0d29f7264f5e9952d4a3a51f5f58.jpg", description: "this is a test", ingredients: "testing", directions: "test", category: "Lunch", datePublished: "9/9/2023", url: "test.com"),
    RecipeModel(name: "Test", image: "https://www.feastingathome.com/wp-content/uploads/2021/10/best-fall-recipes.jpg", description: "this is a test", ingredients: "testing", directions: "test", category: "Lunch", datePublished: "9/9/2023", url: "test.com")
    ]

var dessertMeal: [RecipeModel] =
[
    RecipeModel(name: "Test", image: "https://www.realsimple.com/thmb/2ixrIIlE-44L1MypGHIs2TqIQYk=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/vegetarian-recipes-1672e2b4f9104ed3b3867a2a14889ce9.jpg", description: "this is a test", ingredients: "testing", directions: "test", category: "Lunch", datePublished: "9/9/2023", url: "test.com"),
    RecipeModel(name: "Test", image: "https://www.eatingwell.com/thmb/vFO43UyAy2NBfjOG6wADLLCE-Kc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/cucumber-sandwich-eddcc95811f5426094ea5dbea6a6b026.jpg", description: "this is a test", ingredients: "testing", directions: "test", category: "Lunch", datePublished: "9/9/2023", url: "test.com"),
    RecipeModel(name: "Test", image: "https://assets.bonappetit.com/photos/61b775620fb3fcc4cbf036c1/master/pass/20211208%20Spaghetti%20Squash%20with%20Tomato%20Sauce%20and%20Mozarella%20LEDE.jpg", description: "this is a test", ingredients: "testing", directions: "test", category: "Lunch", datePublished: "9/9/2023", url: "test.com"),
    RecipeModel(name: "Test", image: "https://static01.nyt.com/images/2022/09/29/dining/afg-ricotta-polpette/merlin_213671208_2553d655-4170-4155-acdf-5fca2ce34a06-articleLarge.jpg", description: "this is a test", ingredients: "testing", directions: "test", category: "Lunch", datePublished: "9/9/2023", url: "test.com"),
    RecipeModel(name: "Test", image: "https://cdn.apartmenttherapy.info/image/upload/f_jpg,q_auto:eco,c_fill,g_auto,w_1500,ar_1:1/k%2FPhoto%2FRecipes%2F2021-02-air-fryer-grilled-cheese%2F2021-02-16_ATK109276", description: "this is a test", ingredients: "testing", directions: "test", category: "Lunch", datePublished: "9/9/2023", url: "test.com"),
]
