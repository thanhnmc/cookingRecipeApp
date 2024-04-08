//
//  RecipeCard.swift
//  RecipeListApp
//
//  Created by Nguyen Manh Cong Thanh on 8/4/24.
//

import SwiftUI

struct RecipeCard: View {
    var recipe: Recipe
    
    var body: some View {
        AsyncImage(url: URL(string: recipe.thumb ?? "")) {
            image in
            image.resizable()
                .aspectRatio(contentMode: .fill)
                .overlay(alignment: .bottom) {
                    Text(recipe.name ?? "")
                        .font(.headline)
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 3, x: 0, y: 0)
                        .frame(maxWidth: 136)
                        .padding()
                }
            }
            placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40, alignment: .center)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(width: 160, height: 217, alignment: .top)
            .cornerRadius(8)
    }
}

#Preview {
    RecipeCard(recipe: Recipe(calories: "516 kcal",
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
                              time: "PT35M")
    )
}
