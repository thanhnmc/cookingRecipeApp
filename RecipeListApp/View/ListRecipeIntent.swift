//
//  ListRecipeIntent.swift
//  RecipeListApp
//
//  Created by Nguyen Manh Cong Thanh on 8/4/24.
//

import Foundation

class ListRecipeIntent {
    private var model: ListRecipeState
    private let service: NetworkServiceProtocol
    
    init(model: ListRecipeState, service: NetworkServiceProtocol) {
        self.model = model
        self.service = service
    }
}

extension ListRecipeIntent: RecipeListIntentProtocol {
    func fetchList() {
        model.contentState = .loading
        DispatchQueue.main.async {
            Task {
                do {
                    let recipes = try await self.service.fetchRecipes()
                    if recipes.count == 0 {
                        self.model.contentState = .noRecipesFound
                    }
                    self.model.contentState = .fetched(recipes)
                } catch {
                    self.model.contentState = .apiError(error)
                }
            }
        }
    }
}

protocol RecipeListIntentProtocol {
    func fetchList()
}

