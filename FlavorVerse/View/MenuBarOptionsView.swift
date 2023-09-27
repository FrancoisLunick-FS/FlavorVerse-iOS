//
//  MenuBarOptionsView.swift
//  FlavorVerse
//
//  Created by Lunick Francois on 9/5/23.
//
//  Description: This file contains the menu bar options view for the FlavorVerse app.
//  The menu bar options view displays a horizontal menu bar with different recipe categories,
//  allowing the user to select a category to explore.
//
//  You are welcome to use, modify, and distribute this code under the terms of the MIT license.
//  Please retain this header in all copies of the code.
//
//  Note: This view is part of the FlavorVerse app, which is designed for recipe exploration and cooking.
//


import SwiftUI

struct MenuBarOptionsView: View {
    
    // MARK: - Properties
    
    // Binding to the selected category option
    @Binding var selectedOption: Category
    
    // Binding to the current category option
    @Binding var currentOption: Category
    
    // Namespace for animation
    @Namespace var animation
    
    // MARK: - Body
    var body: some View {
        
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30) {
                    
                    // Iterate through each recipe category option
                    ForEach(Category.allCases, id: \.self) { item in
                        VStack {
                            // Display the category name
                            Text(item.rawValue)
                                .foregroundColor(item == currentOption ? .black : .gray)
                            
                            // Highlight the selected category with a Capsule if it matches the current option
                            if currentOption == item {
                                Capsule()
                                    .fill(.black)
                                    .matchedGeometryEffect(id: "item", in: animation)
                                    .frame(height: 3)
                                    .padding(.horizontal, -10)
                            } else {
                                // Display an empty Capsule if not selected
                                Capsule()
                                    .fill(.clear)
                                    .frame(height: 3)
                                    .padding(.horizontal, -10)
                            }
                        }
                        .onTapGesture {
                            withAnimation {
                                // Update the selected category and scroll to it
                                self.selectedOption = item
                                proxy.scrollTo(item, anchor: .topTrailing)
                            }
                        }
                    }
                    .onChange(of: currentOption) { _ in
                        // Scroll to the current category option when it changes
                        proxy.scrollTo(currentOption, anchor: .topTrailing)
                    }
                }
            }
        }
    }
}
