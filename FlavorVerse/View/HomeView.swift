//
//  HomeView.swift
//  FlavorVerse
//
//  Created by Lunick Francois on 8/31/23.
//
//  Description: This file contains the home view for the FlavorVerse app.
//  The home view is the main screen where users can explore and discover various recipe categories.
//
//  You are welcome to use, modify, and distribute this code under the terms of the MIT license.
//  Please retain this header in all copies of the code.
//
//  Note: This view is part of the FlavorVerse app, which is designed for recipe exploration and cooking.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Properties
    
    // State variables to track the selected and current recipe category
    @State private var selectedOption: Category = .breakfast
    @State private var currentCategory: Category = .breakfast
    
    //    @EnvironmentObject var viewModel: RegistrationViewModel
    
    // MARK: - Body
    var body: some View {
        
        VStack {
            // App title and search button
            HStack {
                Text("Welcome to FlavorVerse")
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .bold()
                    .foregroundColor(.black)
                
                Spacer()
                
                Button {
                    // Handle search button action
                } label: {
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                }
                
            }
            // Menu Options list
            MenuBarOptionsView(selectedOption: $selectedOption, currentOption: $currentCategory)
                .padding([.top, .horizontal])
            NavigationView {
                ScrollViewReader { proxy in
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack {
                            ForEach(Category.allCases, id: \.self) { categoryItem in
                                // Display sections of recipes based on selected category
                                MealSection(category: categoryItem, currentCategory: $currentCategory)
                            }
                        }
                        .onChange(of: selectedOption, perform: { _ in
                            // Scroll to the selected category
                            withAnimation {
                                proxy.scrollTo(selectedOption, anchor: .topTrailing)
                            }
                        })
                        .padding(.horizontal)
                        
                        //ForEach(Men)
                    }
                    .coordinateSpace(name: "scroll")
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
