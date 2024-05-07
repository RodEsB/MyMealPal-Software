//
//  ContainerView.swift
//  SlidingIntro
//
//  Created by Rod Espiritu Berra on 07/03/24.
//

import SwiftUI

struct ContainerView: View {
    @State private var isSplashScreenViewPresented = true
    var body: some View {
        if !isSplashScreenViewPresented {
            ContentView()
        } else{
            SplashScreenView(isPresented: $isSplashScreenViewPresented)
        }
    }
}

#Preview {
    ContainerView()
}
