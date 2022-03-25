//
//  RecipeModel.swift
//  RecipeBrazilianApp
//
//  Created by luane Niejelski on 3/25/22.
//

import Foundation

class RecipeModel:ObservableObject{
    
    @Published var recipes = [Recipe]()
    
    init(){
        
        //Create an instance of data service and get the data
   
        self.recipes = DataService.getLocalData()
        
    }
    
}
