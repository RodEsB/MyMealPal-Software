//
//  File.swift
//  
//
//  Created by Ultiimate Dog on 19/02/24.
//

import Foundation
import SwiftUI

// Creates the struct for the profile
struct Profile {
    var username: String
    var kcal: Int
    var protein: Float
    var carbs: Float
    var fats: Float
    
    var streakDays: Int
    var kcalGoal: Int
    var proteinGoal: Float
    var carbsGoal: Float
    var fatsGoal: Float
    
    var weight: Float
    var height: Float
    var age: Int
    var BMI: Float
    var musclePorcentage: Float
    var fatPorcentage: Float
    var kcalResting: Int
    
    static let `default` = Profile(username: "UltiimateDog", weight: 75, height: 1.75, musclePorcentage: 40, fatPorcentage: 21, age: 20)
    
    init(username: String, weight: Float, height: Float, musclePorcentage: Float, fatPorcentage: Float, age: Int) {
        self.username = username
        kcal = 0
        protein = 0
        carbs = 0
        fats = 0
        streakDays = 40
        kcalGoal = 2500
        proteinGoal = 100
        carbsGoal = 250
        fatsGoal = 80
        self.weight = weight
        self.height = height
        self.age = age
        BMI = weight / (height * height)
        self.musclePorcentage = musclePorcentage
        self.fatPorcentage = fatPorcentage
        kcalResting = Int(BMI * 75)
    }
    
    // Adds the macronutrients of a meal to daily consumption
    mutating func AddMeal(meal: FoodInfo) {
        kcal += meal.kcal
        protein += meal.protein
        carbs += meal.carbs
        fats += meal.fats
    }
    
    // Change the goals of the user
    mutating func ChangeGoals(kcal: Int?, protein: Float?, carbs: Float?, fats: Float?) {
        kcalGoal = kcal != nil ? kcal! : kcalGoal
        proteinGoal = protein != nil ? protein! : proteinGoal
        carbsGoal = carbs != nil ? carbs! : carbsGoal
        fatsGoal = fats != nil ? fats! : fatsGoal
    }
    
    // Returns true if the goals had been achieved, and false if the opposite
    private func AchievedGoals() -> Bool {
        if !(kcal <= kcalGoal+100 && kcal >= kcalGoal-100) {
            return false
        }
        if !(protein <= proteinGoal+5 && protein >= proteinGoal-5) {
            return false
        }
        if !(carbs <= carbsGoal+15 && carbs >= carbsGoal-15) {
            return false
        }
        if !(fats <= fatsGoal+10 && fats >= fatsGoal-10) {
            return false
        }
        return true
    }
    
    // Adds a day to the streak if AchievedGoals is true, and if not, restart the streak
    mutating func UpdateStreak() {
        if AchievedGoals() {
            streakDays += 1
        } else {
            streakDays = 0
        }
    }
    
    // Gets the color of the streak
    func GetStreakColor() -> Color {
        switch streakDays {
            case 0..<5: return Color.blue
            case 5..<10: return Color.purple
            case 10..<20: return Color.red
            case 20..<50: return Color.orange
            default: return Color.accentColor
        }
    }
}
