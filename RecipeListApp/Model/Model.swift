//
//  File.swift
//  RecipeListApp
//
//  Created by Nguyen Manh Cong Thanh on 8/4/24.
//

import Foundation

struct Recipe: Decodable, Identifiable {
    let calories: String?
    let carbos: String?
    let description: String?
    let difficulty: Int?
    let fats: String?
    let headline: String?
    let id: String?
    let image: String?
    let name: String?
    let proteins: String?
    let thumb: String?
    let time: String?
}
