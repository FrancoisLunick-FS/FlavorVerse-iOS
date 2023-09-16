//
//  HomeView.swift
//  FlavorVerse
//
//  Created by Lunick Francois on 8/31/23.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedOption: Category = .breakfast
    
//    @EnvironmentObject var viewModel: RegistrationViewModel
    
    var body: some View {
        
        VStack {
            HStack {
                Text("Welcome to FlavorVerse")
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .bold()
                    .foregroundColor(.black)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                }

            }
            // Menu Options list
            MenuBarOptionsView(selectedOption: $selectedOption)
                .padding([.top, .horizontal])
            NavigationView {
                ScrollView {
                    RecipeList(recipes: RecipeModel.recipes)
                }
            }
                
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
