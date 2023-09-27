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
    @Binding var selectedOption: Category
    @Binding var currentOption: Category
    @Namespace var animation
    
    var body: some View {
        
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30) {
                    
                        ForEach(Category.allCases, id: \.self) { item in
                            VStack {
                            Text(item.rawValue)
                                .foregroundColor(item == currentOption ? .black : .gray)
                            
                            if currentOption == item {
                                Capsule()
                                    .fill(.black)
                                    .matchedGeometryEffect(id: "item", in: animation)
                                    .frame(height: 3)
                                    .padding(.horizontal, -10)
                            } else {
                                Capsule()
                                    .fill(.clear)
                                    .frame(height: 3)
                                    .padding(.horizontal, -10)
                            }
                        }
                            .onTapGesture {
                                withAnimation {
                                    self.selectedOption = item
                                    proxy.scrollTo(item, anchor: .topTrailing)
                                }
                            }
                    }
                        .onChange(of: currentOption) { _ in
                            proxy.scrollTo(currentOption, anchor: .topTrailing)
                        }
                }
            }
        }
    }
}

//struct MenuBarOptionsView_Previews: PreviewProvider {
//    static var previews: some View {
//        MenuBarOptionsView(selectedOption: .constant(.breakfast))
//    }
//}
