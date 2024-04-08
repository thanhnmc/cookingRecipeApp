//
//  DetailRecipeView.swift
//  RecipeListApp
//
//  Created by Nguyen Manh Cong Thanh on 8/4/24.
//

import SwiftUI

struct DetailRecipeView: View {
    
    var recipe: Recipe
    
    var body: some View {
        ScrollView {
            AsyncImage(url: URL(string: recipe.thumb ?? "")) {
                image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
            }
        placeholder: {
            Image(systemName: "photo")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100, alignment: .center)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(height: 300)
            
        VStack(spacing: 30) {
            Text(recipe.name ?? "")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.orange)
                .multilineTextAlignment(.center)
            
            Text(recipe.headline ?? "")
                .font(.headline)
                .bold()
                .foregroundColor(.orange)
                .multilineTextAlignment(.center)
            
            VStack(spacing: 30) {
                Text("Description: \(recipe.description ?? "")")
                    .font(.caption)
                    .foregroundColor(.red)
                Text("Calories: \(recipe.calories ?? "")")
                    .font(.caption)
                    .foregroundColor(.black)
                Text("Carbos: \(recipe.carbos ?? "")")
                    .font(.caption)
                    .foregroundColor(.blue)
                Text("Difficulty: \(recipe.difficulty ?? 0)")
                    .font(.caption)
                    .foregroundColor(.orange)
                Text("Fats: \(recipe.fats ?? "")")
                    .font(.caption)
                    .foregroundColor(.pink)
                Text("Proteins: \(recipe.proteins ?? "")")
                    .font(.caption)
                    .foregroundColor(.gray)
                Text("Proteins: \(recipe.time ?? "")")
                    .font(.caption)
                    .foregroundColor(.black)
            }
            .frame(maxWidth: .infinity, alignment: .bottom)
        }
        .padding(.horizontal)
        }
        .ignoresSafeArea(.container, edges: .top)
    }
}

#Preview {
    DetailRecipeView(recipe: Recipe(calories: "516 kcal",
                            carbos: "47 g",
                            description: "There2019s nothing like the simple things in life - the smell of freshly cut grass, sitting outside on a nice sunny day, spending time with friends and family. Well here is a recipe that delivers simple culinary pleasures - some nice fresh fish with a crispy crust, crunchy potato wedges and some delightfully sweet sugar snap peas flavoured with cooling mint. Slip into something comfortable and relax into a delicious dinner!",
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
