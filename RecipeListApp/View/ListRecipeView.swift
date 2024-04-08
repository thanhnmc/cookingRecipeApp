//
//  ListRecipeView.swift
//  RecipeListApp
//
//  Created by Nguyen Manh Cong Thanh on 8/4/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ListRecipeContentView.build()
        }
    }
}

struct ListRecipeContentView: View {
    @ObservedObject var state: ListRecipeState
    
    private var intent: ListRecipeIntent
    
    init(state: ListRecipeState, intent: ListRecipeIntent) {
        self.state = state
        self.intent = intent
    }
    
    var body: some View {
        Group {
            switch state.contentState {
            case .initial:
                InitView()
            case .loading:
                LoadingView()
            case .fetched(let list):
                RecipeList(recipes: list)
                    .navigationBarTitle("\(list.count) Recipes")
            case .noRecipesFound:
                NoRecipesView()
            case .apiError(let error):
                ErrorView(error: error)
            }
        }
        .onAppear(perform: intent.fetchList)
    }
}

struct InitView: View {
    var body: some View {
        Text("Init")
    }
}

struct LoadingView: View {
    var body: some View {
        Text("Loading")
    }
}

struct NoRecipesView: View {
    var body: some View {
        Text("No recipes found")
    }
}

struct ErrorView: View {
    var error: Error
    
    var body: some View {
        Text("\(error.localizedDescription)")
    }
}

extension ListRecipeContentView {
    static func build() -> some View {
        let state = ListRecipeState()
        let intent: ListRecipeIntent = ListRecipeIntent(
            model: state,
            service: NetworkService.shared
        )
        return ListRecipeContentView(state: state , intent: intent)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
