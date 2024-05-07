//
//  SplashScreenView.swift
//  SlidingIntro
//
//  Created by Rod Espiritu Berra on 07/03/24.
//

import SwiftUI

struct SplashScreenView: View {
    
    @Binding var isPresented: Bool
    
    @State private var scale = CGSize(width: 0.8, height: 0.8)
    @State private var ImageOpacity = 1.0
    @State private var opacity = 1.0
    
    var body: some View {
        ZStack{
            Color(red: 95/255, green: 223/255, blue: 119/255).ignoresSafeArea()
            
            ZStack{
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .opacity(ImageOpacity)
                    .frame(width: 100, height: 100)
                    .offset(x: 1)
            }
            .scaleEffect(scale)
        }
        .opacity(opacity)
        .onAppear{ //Cuando aparece el logo
            withAnimation(.easeInOut(duration: 1.5)){
                scale = CGSize(width: 1, height: 1)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                withAnimation(.easeIn(duration: 0.35)){
                    scale = CGSize(width: 50, height: 50)
                    opacity = 0
                }
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
                withAnimation(.easeIn(duration: 0.2)){
                    isPresented.toggle()
                }
            })
            
        }
    }
}

#Preview {
    SplashScreenView(isPresented: .constant(true))
}
