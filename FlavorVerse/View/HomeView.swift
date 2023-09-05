//
//  HomeView.swift
//  FlavorVerse
//
//  Created by Lunick Francois on 8/31/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                RecipeList(recipes: RecipeModel.recipes)
            }
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
