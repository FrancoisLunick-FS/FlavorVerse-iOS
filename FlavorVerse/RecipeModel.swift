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
//  Git Repository: https://github.com/FrancoisLunick-FS/FlavorVerse-iOS
//
//  Note: The FlavorVerse app is designed for recipe exploration and cooking.
//


import Foundation

/// Enum to represent different recipe categories
enum Category: String, CaseIterable {
    case breakfast = "Breakfast"
    case lunch = "Lunch"
    case dinner = "Dinner"
    case dessert = "Dessert"
    
    // Mapping of categories to their respective recipe models
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

// Data structure representing a recipe
struct RecipeModel: Identifiable {
    // Unique identifier for the recipe
    let id = UUID().uuidString
    // Name of the recipe
    let name: String
    // URL of the recipe's image
    let image: String
    // Description of the recipe
    let description: String
    // Ingredients list for the recipe
    let ingredients: String
    // Cooking directions for the recipe
    let directions: String
    // Category to which the recipe belongs
    let category: Category.RawValue
    // Publication date of the recipe
    let datePublished: String
    // URL to the full recipe details
    let url: String
    
}

// Sample data for the breakfast category
var breakfastMeal: [RecipeModel] = [
    .init(name: "Blueberry Coffee Cake Muffins", image: "https://food.fnr.sndimg.com/content/dam/images/food/fullset/2006/9/12/0/ig0706_muffins.jpg.rend.hgtvcom.966.725.suffix/1449692683261.jpeg", description: "Ina adds sour cream to her blueberry muffins to make them extra moist.", ingredients: "testing", directions: "test", category: "Breakfast", datePublished: "9/9/2023", url: "https://hips.hearstapps.com/hmg-prod/images/delish-202002-pozole-0392-landscape-pf-1582315071.jpg?crop=1xw:0.8441943127962085xh;center,top&resize=1200:*"),
    .init(name: "Papeta par Eda", image: "https://food.fnr.sndimg.com/content/dam/images/food/fullset/2021/06/14/0/FNK_Papeta-Par-Eda_H2_s4x3.jpg.rend.hgtvcom.966.725.suffix/1623679052424.jpeg", description: "Recipe devloper Nidhi Jalan says, \"The most amazing egg recipes in India are found in the Parsi community, but papeta par eda (eggs over potatoes) is hands-down my favorite. Sometimes it’s even prepared with potato chips instead of sliced potatoes! If you have any leftover cooked potatoes, you can reheat them in a small skillet and poach a fresh egg on top. Sprinkle with some more chopped cilantro and you have a delicious dish in minutes.\"", ingredients: "testing", directions: "test", category: "Breakfast", datePublished: "9/9/2023", url: "test.com")
]

// Sample data for the lunch category
var lunchMeal: [RecipeModel] = [
    RecipeModel(name: "Chipotle Veggie Burritos", image: "https://food.fnr.sndimg.com/content/dam/images/food/fullset/2014/6/11/1/FNM_070114-Chipotle-Veggie-Burritos-Recipe_s4x3.jpg.rend.hgtvcom.966.725.suffix/1402596449691.jpeg", description: "Burritos can be a healthy, vegetarian dish when you load them up with wholesome ingredients like rice, beans and corn.", ingredients: "testing", directions: "test", category: "Lunch", datePublished: "9/9/2023", url: "test.com"),
    RecipeModel(name: "Lemon-Herb Rice Salad", image: "https://food.fnr.sndimg.com/content/dam/images/food/fullset/2012/4/5/0/FNM_050112-WE-Dinners-011_s4x3.jpg.rend.hgtvcom.966.725.suffix/1371606214789.jpeg", description: "Fresh herbs, like mint and basil, add bursts of fresh flavor to this simple salad. Make sure you leave room for leftovers — the dish tastes even better the next day!", ingredients: "testing", directions: "test", category: "Lunch", datePublished: "9/9/2023", url: "test.com")
]

// Sample data for the dinner category
var dinnerMeal: [RecipeModel] =
[
    RecipeModel(name: "Classic Shrimp Scampi", image: "https://food.fnr.sndimg.com/content/dam/images/food/fullset/2020/07/16/0/FNM_090120-Classic-Shrimp-Scampi_s4x3.jpg.rend.hgtvcom.966.725.suffix/1594915956100.jpeg", description: "We can't get enough of shrimp scampi! Do we love it because it’s simple but seemingly fancy? Or because it’s done in 30 minutes? Or because we just can’t resist a buttery wine sauce? All of the above!", ingredients: "testing", directions: "test", category: "Dinner", datePublished: "9/9/2023", url: "test.com"),
    RecipeModel(name: "Hot Sausage Cast-Iron Skillet Pan Pizza", image: "https://food.fnr.sndimg.com/content/dam/images/food/fullset/2019/2/0/TM2806_Hot-Sausage-Cast-Iron-Skillet-Pan-Pizza.jpg.rend.hgtvcom.966.725.suffix/1552666959071.jpeg", description: "The key to a pan pizza is preheating the pan so the dough starts to cook right after it is placed inside. That'll help you get a super crispy crust on the bottom.", ingredients: "testing", directions: "test", category: "Dinner", datePublished: "9/9/2023", url: "test.com"),
    RecipeModel(name: "Sweet and Sour Glazed Shrimp", image: "https://food.fnr.sndimg.com/content/dam/images/food/fullset/2018/4/1/1/LS-Library_Sweet-Sour-Glazed-Shrimp_s4x3.jpg.rend.hgtvcom.966.725.suffix/1522651448204.jpeg", description: "You won't believe how easy it is to get the perfect balance of flavors for this shrimp. Just mix Chinese plum sauce, ketchup and rice wine vinegar.", ingredients: "testing", directions: "test", category: "Dinner", datePublished: "9/9/2023", url: "test.com"),
    RecipeModel(name: "Skillet Chicken Tortellini Alfredo", image: "https://food.fnr.sndimg.com/content/dam/images/food/fullset/2017/8/28/0/FNK_SKILLET-CHICKEN-TORTELLINI-ALFREDO-H_s4x3.jpg.rend.hgtvcom.966.725.suffix/1503928454027.jpeg", description: "Store-bought tortellini are the star of this quick and creamy weeknight meal. They simmer in their own sauce, making this a one-skillet meal with easy cleanup. Try one-inch pieces of Italian sausage instead of chicken for a variation.", ingredients: "testing", directions: "test", category: "Dinner", datePublished: "9/9/2023", url: "test.com")
]

// Sample data for the dessert category
var dessertMeal: [RecipeModel] =
[
    RecipeModel(name: "Coconut Sugar Carrot-Banana Cupcakes with Coconut Sugar Meringue Frosting", image: "https://food.fnr.sndimg.com/content/dam/images/food/fullset/2015/8/28/0/FN_Coconut-Sugar-Carrot-Banana-Cupcakes_s4x3.jpg.rend.hgtvcom.966.725.suffix/1440790647153.jpeg", description: "Coconut sugar comes made from the evaporated sap of the coconut palm tree (which means it's not coconut flavored) and has a bold, exotic sweetness, lending these cupcakes their sweet and robust flavor. Coconut sugar also makes for the most-glorious, creamy meringue frosting, giving the topping a hint of salted caramel flavor, without your having to make caramel.", ingredients: "testing", directions: "test", category: "Dessert", datePublished: "9/9/2023", url: "test.com"),
    RecipeModel(name: "Muscovado Cocoa Chip Cookies", image: "https://food.fnr.sndimg.com/content/dam/images/food/fullset/2015/8/28/0/FN_Muscovado-Cocoa-Chip-Cookies_s4x3.jpg.rend.hgtvcom.966.725.suffix/1440790643291.jpeg", description: "Molasses-heavy muscovado sugar and intense bittersweet chocolate create an insanely fudgy texture in these craveworthy cookies. The secrets to perfecting these cookies are: Avoid overmixing the dough; and, to avoid overcooking, bake it straight from frozen and pull the cookies from the oven when they're almost underdone.", ingredients: "testing", directions: "test", category: "Dessert", datePublished: "9/9/2023", url: "test.com"),
    RecipeModel(name: "Honeyed Lemon-Berry Snack Cake", image: "https://food.fnr.sndimg.com/content/dam/images/food/fullset/2015/8/28/0/FN_Honeyed-Lemon-Berry-Snack-Cake_s4x3.jpg.rend.hgtvcom.966.725.suffix/1440790646782.jpeg", description: "Honey not only pairs beautifully with citrus and berries, but it also is hygroscopic, which means that it pulls moisture from the air. This property helps create the cake's moist, dense, almost-pound-cake-like texture and will continue to improve the texture in the days after baking.", ingredients: "testing", directions: "test", category: "Dessert", datePublished: "9/9/2023", url: "test.com"),
    RecipeModel(name: "Turbinado Creme Brulee Tart", image: "https://food.fnr.sndimg.com/content/dam/images/food/fullset/2015/8/28/0/FN_Turbinado-Creme-Brulee-Tart_s4x3.jpg.rend.hgtvcom.966.725.suffix/1440790646020.jpeg", description: "This tart marries classic creme brulee with an orange-scented cheesecake, all finished with a shiny, caramelized cap of turbinado sugar.", ingredients: "testing", directions: "test", category: "Dessert", datePublished: "9/9/2023", url: "test.com"),
    RecipeModel(name: "Soft Maple Cookies", image: "https://food.fnr.sndimg.com/content/dam/images/food/fullset/2015/8/28/0/FN_Soft-Maple-Oatmeal-Cookies_s4x3.jpg.rend.hgtvcom.966.725.suffix/1440790646366.jpeg", description: "Liquid sweeteners like maple syrup help create soft-baked cookies. Jazz up this simple, satisfying treat with a handful of dried fruit, chopped toasted pecans or bittersweet chocolate chips.", ingredients: "testing", directions: "test", category: "Dessert", datePublished: "9/9/2023", url: "test.com"),
]
