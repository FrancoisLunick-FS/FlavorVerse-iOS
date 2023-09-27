//
//  HomeView.swift
//  FlavorVerse
//
//  Created by Lunick Francois on 8/31/23.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedOption: Category = .breakfast
    @State private var currentCategory: Category = .breakfast
    
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
            MenuBarOptionsView(selectedOption: $selectedOption, currentOption: $currentCategory)
                .padding([.top, .horizontal])
            NavigationView {
                ScrollViewReader { proxy in
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack {
                            ForEach(Category.allCases, id: \.self) { categoryItem in
                                
                                MealSection(category: categoryItem, currentCategory: $currentCategory)
                            }
                        }
                        .onChange(of: selectedOption, perform: { _ in
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
