//
//  FoodIdentiferButton.swift
//  MealPal
//
//  Created by Ultiimate Dog on 13/02/24.
//

import SwiftUI

struct FoodIdentiferButton: View {
    let dWidth: Double
    
    var body: some View {
        // Set the visuals of the scan Meal Button
        Rectangle()
            .fill(Color.red)
            //.blur(radius: 5)
            .frame( width: dWidth*0.96, height:dWidth*0.47)
            .cornerRadius(dWidth * 0.0636)
            .overlay {
                Text("Scan Meal")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()
            }
            .padding(.all, 5)
    }
}

#Preview {
    FoodIdentiferButton(dWidth: 300)
}
