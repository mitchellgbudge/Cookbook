//
//  Recipe+Convenience.swift
//  Cookbook
//
//  Created by Mitchell Budge on 9/17/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

import Foundation
import CoreData

extension Recipe {
    convenience init(title: String, cuisine: String, directions: String, context: NSManagedObjectContext) {
        self.init(context: context)
        self.title = title
        self.cuisine = cuisine
        self.directions = directions
    }
}
