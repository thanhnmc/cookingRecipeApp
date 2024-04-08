//
//  RecipeList.swift
//  RecipeListApp
//
//  Created by Nguyen Manh Cong Thanh on 8/4/24.
//

import SwiftUI

struct RecipeList: View {
    var recipes: [Recipe]
    
    var body: some View {
        ScrollView {
            VStack {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
                    ForEach(recipes) { recipe in
                        NavigationLink(destination: DetailRecipeView(recipe: recipe)) {
                            RecipeCard(recipe: recipe)
                        }
                    }
                }
                .padding(.top)
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    RecipeList(recipes: [Recipe(calories: "516 kcal",
                                carbos: "47 g",
                                description: "Theretable and relax into a delicious dinner!",
                                difficulty: 0,
                                fats: "8 g",
                                headline: "with Sweet Potato Wedges and Minted Snap Peas",
                                id: "533143aaff604d567f8b4571",
                                image: "https://img.hellofresh.com/f_auto,q_auto/hellofresh_s3/image/533143aaff604d567f8b4571.jpg",
                                name: "Crispy Fish Goujons ",
                                proteins: "43 g",
                                thumb: "https://img.hellofresh.com/f_auto,q_auto,w_300/hellofresh_s3/image/533143aaff604d567f8b4571.jpg",
                                time: "PT35M")])
}
