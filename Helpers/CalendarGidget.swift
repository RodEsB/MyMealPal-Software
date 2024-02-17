//
//  SwiftUIView.swift
//  
//
//  Created by Ultiimate Dog on 14/02/24.
//

import SwiftUI

struct CalendarGidget: View {
    
    // This is just to show there´ll be something
    // This isnt the actual calendar currently
    @State private var kcalProgress = 0.2 //Test of value
    let dWidth: Double
    
    var body: some View {
        // Set the visuals of the progress widget
        VStack(spacing: 0) {
            // Gives the looks of a progress bar
            VStack(spacing: 0) {
                Rectangle()
                    .fill(Color.blue)
                Rectangle()
                    .fill(Color.blue)
                    .frame(height: dWidth*0.47 * kcalProgress)
            }
        }
        .frame( width: dWidth*0.47, height:dWidth*0.47)
        .overlay {
            Text("Calendar Streak 🔥")
                .font(.largeTitle)
                .foregroundColor(.white)
                .bold()
        }
        // Sets the rounded look of the gidget
        .clipShape(RoundedRectangle(cornerRadius: dWidth * 0.0636, style: .continuous))
        .padding(.all, 5)

    }
}

#Preview {
    CalendarGidget(dWidth: 300)
}
