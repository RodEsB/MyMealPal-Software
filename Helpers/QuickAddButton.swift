//
//  SwiftUIView.swift
//  
//
//  Created by Ultiimate Dog on 14/02/24.
//
import SwiftUI

struct QuickAddButton: View {
    let dWidth: Double
    let dHeight: Double
    
    var body: some View {
        // Set the visuals of the scan Meal Button
        Rectangle()
            .fill(Color.red)
            //.blur(radius: 5)
            .frame( width: dWidth*0.85, height:dHeight*0.05)
            .cornerRadius(dWidth * 0.0636)
            .overlay {
                Text("Ham")
                    .font(.title2)
                    .foregroundColor(.white)
                    .bold()
            }
            .padding(.all, 5)
    }
}

#Preview {
    QuickAddButton(dWidth: 400, dHeight: 700)
}
