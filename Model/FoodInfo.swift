//
//  FoodInfo.swift
//  MyMealPal
//
//  Created by Ultiimate Dog on 19/02/24.
//

import Foundation

// Contains all of the information of the food
// The calories are measure in kiloCalories not in Joules
// All of the macronutrients are in gr
struct FoodInfo: Identifiable {
    var name: String
    var kcal: Int
    var protein: Float
    var carbs: Float
        var sugar: Float // How many carbs are sugar
    var fats: Float
        var saturatedFat: Float // How many fats are saturated
        var unsaturatedFat: Float // How many fats are unsaturated
        var transFat: Float // How many fats are trans
    var id: String { name }
    var grams = 100 // The macronutrients are measure in 100gr
    
    init(name: String, kcal: Int, protein: Float, carbs: Float, sugar: Float, fats: Float, saturatedFat: Float, unsaturatedFat: Float, transFat: Float) {
        self.name = name
        self.kcal = kcal
        self.protein = protein
        self.carbs = carbs
        self.sugar = sugar
        self.fats = fats
        self.saturatedFat = saturatedFat
        self.unsaturatedFat = unsaturatedFat
        self.transFat = transFat
    }
    
    // Change the info accordingly to the quantity
    mutating func changeGrams(newGrams: Int) {
        if (newGrams <= 0) {
            return
        }
        let change = Float(newGrams) / Float(grams)
        grams = newGrams
        kcal = Int(Float(kcal) * change)
        protein = round(protein * change * 100) / 100.0
        carbs = round(carbs * change * 100) / 100.0
        sugar = round(sugar * change * 100) / 100.0
        fats = round(fats * change * 100) / 100.0
        saturatedFat = round(saturatedFat * change * 100) / 100.0
        unsaturatedFat = round(unsaturatedFat * change * 100) / 100.0
        transFat = round(transFat * change * 100) / 100.0
    }
}

struct TestData {
    let hamburger = FoodInfo(name: "Hamburger",
                              kcal: 295,
                              protein: 17,
                              carbs: 24,
                              sugar: 4.2,
                              fats: 14,
                              saturatedFat: 5,
                              unsaturatedFat: 14 - 5.8,
                              transFat: 0.8)
    let hot_dog = FoodInfo(name: "Hot dog",
                              kcal: 290,
                              protein: 10,
                              carbs: 4.2,
                              sugar: 2,
                              fats: 26,
                              saturatedFat: 8,
                              unsaturatedFat: 14,
                              transFat: 0)
    let banana = FoodInfo(name: "Banana",
                              kcal: 89,
                              protein: 1.1,
                              carbs: 23,
                              sugar: 12,
                              fats: 0.3,
                              saturatedFat: 0.1,
                              unsaturatedFat: 0,
                              transFat: 0)
    let apple_pie = FoodInfo(name: "Apple Pie",
                              kcal: 265,
                              protein: 1.9,
                              carbs: 37.1,
                              sugar: 25,
                              fats: 12.5,
                              saturatedFat: 3,
                              unsaturatedFat: 5,
                              transFat: 3)
    let dataArray: [FoodInfo]
    init() {
        dataArray = [apple_pie, banana, hamburger, hot_dog]
    }
}
