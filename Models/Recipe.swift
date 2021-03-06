//
//  Recipe.swift
//  RecipeBrazilianApp
//
//  Created by luane Niejelski on 3/25/22.
//

import Foundation
import SwiftUI

class Recipe: Identifiable, Decodable{
    
    var id:UUID?
    var name:String
    var categories:String
    var featured:Bool
    var image:String
    var description:String
    var prepTime:String
    var cookTime:String
    var totalTime:String
    var servings: Int
    var highlights:[String]
    var ingredients: [Ingredient]
    var directions:[String]
    
 
   
   
    
}
class Ingredient: Identifiable, Decodable {
    
    var id: UUID?
    var name:String
    var num: Int?
    var denom: Int?
    var unit: String?
}

