//
//  RecipeDetailView.swift
//  RecipeBrazilianApp
//
//  Created by luane Niejelski on 3/25/22.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    @EnvironmentObject var model: RecipeModel
    
    @State var selectedServingSize = 2
    
    var body: some View {
        
        ScrollView{
            
            VStack(alignment:.leading){
                
                //MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                //MARK: Recipe title
                Text(recipe.name)
                    .bold()
                    .multilineTextAlignment(.leading)
                    .padding(.top,5)
                    .padding(.leading)
                    .font(.title)
                    
                
                //MARK: Serving size picker
                VStack (alignment: .leading){
                    Text("Select your serving size:")
                    Picker("", selection: $selectedServingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width:160)
                }
                
                //MARK: Ingredients
                VStack(alignment: .leading) {
                    
                    Text("Ingredients")
                        .font(.headline)
                        .padding([.bottom, .top],5)
                    ForEach(recipe.ingredients) { item in
                        
                        Text("•" + RecipeModel.getPortion(ingredient: item, recipeServings: recipe.servings, targetServings: selectedServingSize) + " " + item.name.lowercased())
                    }
                }
                .padding(.horizontal)
                
                //MARK: Divider
                Divider()
                
                //MARK: Directions
                
                VStack(alignment:.leading){
                    
                    Text("Directions")
                        .font(.headline)
                        .padding([.bottom, .top],5)
                    
                    ForEach(0..<recipe.directions.count, id: \.self) { index in
                        
                        Text(String(index + 1) + "." + recipe.directions[index])
                            .padding(.bottom,5)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        //Create a dummy recipe and pass it to the detail view so that we see a preview
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
