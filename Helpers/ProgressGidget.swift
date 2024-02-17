//
//  SwiftUIView.swift
//  
//
//  Created by Ultiimate Dog on 14/02/24.
//

import SwiftUI

// For kcal
struct ProgressGidget: View {
    @ObservedObject var modelData: ModelData = .shared
    let dWidth: Double
    
    var body: some View {
        // Set the visuals of the progress widget
        VStack(spacing: 0) {
            // Gives the looks of a progress bar
            VStack(spacing: 0) {
                Rectangle()
                    .fill(Color.gray)
                Rectangle()
                    .fill(Color.accentColor)
                    .frame(height: dWidth*0.47 * Double(modelData.profile.kcal) / Double(modelData.profile.kcalGoal))
            }
        }
        .frame( width: dWidth*0.47, height:dWidth*0.47)
        .overlay {
            VStack {
                Text("Energy:")
                    .font(.title3)
                    .italic()
                    .bold()
                    .foregroundColor(.white)
                Text(String(modelData.profile.kcal) + " kcal")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()
            }
        }
        // Sets the rounded look of the gidget
        .clipShape(RoundedRectangle(cornerRadius: dWidth * 0.0636, style: .continuous))
        .padding(.all, 5)
    }
}

// For protein
struct ProgressGidget2: View {
    @ObservedObject var modelData: ModelData = .shared
    let dWidth: Double
    
    var body: some View {
        // Set the visuals of the progress widget
        VStack(spacing: 0) {
            // Gives the looks of a progress bar
            VStack(spacing: 0) {
                Rectangle()
                    .fill(Color.gray)
                Rectangle()
                    .fill(Color.red)
                    .frame(height: dWidth*0.47 * Double(modelData.profile.protein) / Double(modelData.profile.proteinGoal))
            }
        }
        .frame( width: dWidth*0.47, height:dWidth*0.47)
        .overlay {
            VStack {
                Text("Protein:")
                    .font(.title3)
                    .italic()
                    .bold()
                    .foregroundColor(.white)
                Text(String(modelData.profile.protein) + " gr")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()
            }
        }
        // Sets the rounded look of the gidget
        .clipShape(RoundedRectangle(cornerRadius: dWidth * 0.0636, style: .continuous))
        .padding(.all, 5)
    }
}

// For protein
struct ProgressGidget3: View {
    @ObservedObject var modelData: ModelData = .shared
    let dWidth: Double
    
    var body: some View {
        // Set the visuals of the progress widget
        VStack(spacing: 0) {
            // Gives the looks of a progress bar
            VStack(spacing: 0) {
                Rectangle()
                    .fill(Color.gray)
                Rectangle()
                    .fill(Color.init(red: 0.54, green: 0.25, blue: 0))
                    .frame(height: dWidth*0.47 * Double(modelData.profile.carbs) / Double(modelData.profile.carbsGoal))
            }
        }
        .frame( width: dWidth*0.47, height:dWidth*0.47)
        .overlay {
            VStack {
                Text("Carbohydrates:")
                    .font(.title3)
                    .italic()
                    .bold()
                    .foregroundColor(.white)
                Text(String(modelData.profile.carbs) + " gr")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()
            }
        }
        // Sets the rounded look of the gidget
        .clipShape(RoundedRectangle(cornerRadius: dWidth * 0.0636, style: .continuous))
        .padding(.all, 5)
    }
}

// For protein
struct ProgressGidget4: View {
    @ObservedObject var modelData: ModelData = .shared
    let dWidth: Double
    
    var body: some View {
        // Set the visuals of the progress widget
        VStack(spacing: 0) {
            // Gives the looks of a progress bar
            VStack(spacing: 0) {
                Rectangle()
                    .fill(Color.gray)
                Rectangle()
                    .fill(Color.orange)
                    .frame(height: dWidth*0.47 * Double(modelData.profile.fats) / Double(modelData.profile.fatsGoal))
            }
        }
        .frame( width: dWidth*0.47, height:dWidth*0.47)
        .overlay {
            VStack {
                Text("Fats:")
                    .font(.title3)
                    .italic()
                    .bold()
                    .foregroundColor(.white)
                Text(String(modelData.profile.fats) + " gr")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()
            }
        }
        // Sets the rounded look of the gidget
        .clipShape(RoundedRectangle(cornerRadius: dWidth * 0.0636, style: .continuous))
        .padding(.all, 5)
    }
}

#Preview {
    ProgressGidget(dWidth: 300)
}
