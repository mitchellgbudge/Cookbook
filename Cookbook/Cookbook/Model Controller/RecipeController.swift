//
//  RecipeController.swift
//  Cookbook
//
//  Created by Mitchell Budge on 9/17/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

import Foundation

class RecipeController {
    
    // MARK: - Methods
    
    @discardableResult func createRecipe(title: String, cuisine: String, directions: String) -> Recipe {
        let recipe = Recipe(title: title, cuisine: cuisine, directions: directions, context: CoreDataStack.shared.mainContext)
        CoreDataStack.shared.saveToPersistentStore()
        return recipe
    }
    
    func deleteRecipe(recipe: Recipe) {
        CoreDataStack.shared.mainContext.delete(recipe)
        CoreDataStack.shared.saveToPersistentStore()
    }
    
}
