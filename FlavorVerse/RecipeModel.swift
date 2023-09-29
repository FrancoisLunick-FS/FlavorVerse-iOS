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
    .init(name: "Blueberry Coffee Cake Muffins", image: "https://food.fnr.sndimg.com/content/dam/images/food/fullset/2006/9/12/0/ig0706_muffins.jpg.rend.hgtvcom.966.725.suffix/1449692683261.jpeg", description: "Ina adds sour cream to her blueberry muffins to make them extra moist.", ingredients: "testing", directions: "test", category: "Breakfast", datePublished: "9/9/2023", url: "https://www.foodnetwork.com/recipes/ina-garten/blueberry-coffee-cake-muffins-recipe-1917173"),
    .init(name: "Papeta par Eda", image: "https://food.fnr.sndimg.com/content/dam/images/food/fullset/2021/06/14/0/FNK_Papeta-Par-Eda_H2_s4x3.jpg.rend.hgtvcom.966.725.suffix/1623679052424.jpeg", description: "Recipe devloper Nidhi Jalan says, \"The most amazing egg recipes in India are found in the Parsi community, but papeta par eda (eggs over potatoes) is hands-down my favorite. Sometimes it’s even prepared with potato chips instead of sliced potatoes! If you have any leftover cooked potatoes, you can reheat them in a small skillet and poach a fresh egg on top. Sprinkle with some more chopped cilantro and you have a delicious dish in minutes.\"", ingredients: "testing", directions: "test", category: "Breakfast", datePublished: "9/9/2023", url: "https://www.foodnetwork.com/recipes/food-network-kitchen/papeta-par-eda-11148237"),
    .init(name: "Tortilla Breakfast Wrap", image: "https://food.fnr.sndimg.com/content/dam/images/food/fullset/2020/10/14/0/FNK_TORTILLA_BREAKFAST_WRAP_H_f_s4x3.jpg.rend.hgtvcom.966.725.suffix/1602696910893.jpeg", description: "Inspired by the Egg and Cheese Bread Omelet, we made a complete breakfast wrap--tortilla, eggs, spinach, cheese and ham included--entirely in one skillet, for a go-to dish you can make in a hurry. Enjoy right out of the pan or with a few dashes of your favorite hot sauce.", ingredients: "testing", directions: "test", category: "Breakfast", datePublished: "9/9/2023", url: "https://www.foodnetwork.com/recipes/food-network-kitchen/tortilla-breakfast-wrap-9349390"),
    .init(name: "Oatmeal Glazed Breakfast Cake", image: "https://food.fnr.sndimg.com/content/dam/images/food/fullset/2020/12/21/0/FN_Oatmeal-Glazed-Breakfast-Cake-H1_s4x3.jpg.rend.hgtvcom.966.725.suffix/1608578899427.jpeg", description: "It's official; you can eat cake for breakfast. Yep, you read that right: cake. That's because we've packed it with oats, flavored with cinnamon and topped with a nutty glaze. It’s a great way to clean out the pantry and prep breakfast for a few days all at once.", ingredients: "testing", directions: "test", category: "Breakfast", datePublished: "9/9/2023", url: "https://www.foodnetwork.com/recipes/food-network-kitchen/oatmeal-glazed-breakfast-cake-9541347"),
    .init(name: "Cold Brew Iced Coffee", image: "https://food.fnr.sndimg.com/content/dam/images/food/fullset/2020/06/23/0/FNK_Cold-Brew-Iced-Coffee-H_s4x3.jpg.rend.hgtvcom.966.725.suffix/1592939625804.jpeg", description: "This recipe makes just two servings of cold brew, so if you're new to the method, it will be a good test batch to see exactly how strong you want your steep to be. Once you've found your sweet spot of brewing time, you can double, triple or even quadruple the yield. The strained concentrate will keep tightly sealed in the fridge for up to a week.", ingredients: "testing", directions: "test", category: "Breakfast", datePublished: "9/9/2023", url: "https://www.foodnetwork.com/recipes/food-network-kitchen/cold-brew-iced-coffee-8668129"),
    .init(name: "Full Irish Breakfast", image: "https://food.fnr.sndimg.com/content/dam/images/food/fullset/2021/03/11/FNK_FULL_IRISH_BREAKFAST_H_f.jpg.rend.hgtvcom.966.773.suffix/1615507355216.jpeg", description: "When the Irish call this a full breakfast, they’re not kidding. We’ve given you all the traditional components here, but if you’re looking for a smaller meal, feel free to mix and match. Irish bacon is leaner than American-style bacon, so Canadian bacon is the closest substitute. If you’re feeling ambitious, you can also bake a loaf of soda bread to stand in for your toast.", ingredients: "testing", directions: "test", category: "Breakfast", datePublished: "9/9/2023", url: "https://www.foodnetwork.com/recipes/food-network-kitchen/full-irish-breakfast-9843783"),
    .init(name: "Pancakes", image: "https://food.fnr.sndimg.com/content/dam/images/food/fullset/2011/7/27/0/BW2A05_pancakes_s4x3.jpg.rend.hgtvcom.966.725.suffix/1382375822579.jpeg", description: "For the ultimate pancakes, skip on the store-bought mix and make this easy batter instead.", ingredients: "testing", directions: "test", category: "Breakfast", datePublished: "9/9/2023", url: "https://www.foodnetwork.com/recipes/food-network-kitchen/pancakes-recipe-1913844"),
    .init(name: "Menemen", image: "https://food.fnr.sndimg.com/content/dam/images/food/fullset/2021/12/16/0/2108115_FN_Turkish-scrambled-eggs-and-tomatoes_4x3_v1_H.JPG.rend.hgtvcom.966.725.suffix/1639674220787.jpeg", description: "Turkish scrambled eggs and tomatoes is an easy breakfast dish that you can find all around the country. In Iran, the same dish is called “omelet.” There has always been a debate whether menemen should have onions or not and the result is always a 50/50 split. Other variations of menemen use cheese (such as kaşar) or Turkish dry sausage (also known as sucuk). This dish is originally made with Turkish sweet green pepper (yeşil biber) but here we substitute an easier-to-find Italian sweet pepper (cubanelle). Other good options include green bell pepper or sweet banana pepper.", ingredients: "testing", directions: "test", category: "Breakfast", datePublished: "9/9/2023", url: "https://www.foodnetwork.com/recipes/menemen-12078168"),
    .init(name: "Egg-Stuffed Bacon and Cheese Muffins", image: "https://food.fnr.sndimg.com/content/dam/images/food/fullset/2022/04/04/0/FN_EGG-STUFFED-BACON-AND-CHEESE-MUFFINS-H-f_s4x3.jpg.rend.hgtvcom.966.725.suffix/1649101697234.jpeg", description: "Enjoy a full breakfast in one loaded muffin: soft-boiled eggs included! Inspired by the beloved muffins from San Francisco bakery Craftsman and Wolves that have taken patrons and TikTok enthusiasts by storm, we gave these muffins a unique spin with crispy bacon and salty Irish Cheddar studded in each bite. Make sure not to overbake--doing so could turn the beautifully jammy eggs to hard-boiled in a matter of minutes. Serve these warm on their own, or with a sprinkle of flaky sea salt and hot sauce for a transportable, savory, breakfast.", ingredients: "testing", directions: "test", category: "Breakfast", datePublished: "9/9/2023", url: "https://www.foodnetwork.com/recipes/food-network-kitchen/egg-stuffed-bacon-and-cheese-muffins-12431580"),
    .init(name: "2-Ingredient Bagels", image: "https://food.fnr.sndimg.com/content/dam/images/food/fullset/2020/06/18/FN_Food-Network-Kitchen_two-Ingredient-Bagels_s4x3.jpg.rend.hgtvcom.966.725.suffix/1592492736540.jpeg", description: "These shortcut bagels call for just two ingredients and take less than an hour to come together—no yeast or rising time required thanks to the use of self-rising flour. And unlike in traditional recipes, you don't need to par-boil the bagels before baking. You may want to brush the top of the bagels with egg wash and sprinkle with your favorite toppings, though they will taste great without this extra step.", ingredients: "testing", directions: "test", category: "Breakfast", datePublished: "9/9/2023", url: "https://www.foodnetwork.com/recipes/food-network-kitchen/2-ingredient-bagels-8654391")
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
