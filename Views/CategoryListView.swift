//
//  CategoryListView.swift
//  RecipeBrazilianApp
//
//  Created by luane Niejelski on 4/13/22.
//

import SwiftUI

struct CategoryListView: View {
    
    @EnvironmentObject var model: RecipeModel
    
    var body: some View {
        
        NavigationView {
            List {
                
                ForEach(model.recipes) { r in
                    NavigationLink{
                        ScrollView{
                            RecipeListView(recipes: Recipe.all.filter) {$0.category == Category.rawValue})
                        }
                    }
                }
            }
        }
       
    }
}

struct CategoryListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListView()
    }
}
