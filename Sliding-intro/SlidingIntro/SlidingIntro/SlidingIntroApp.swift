//
//  SlidingIntroApp.swift
//  SlidingIntro
//
//  Created by Rod Espiritu Berra on 05/03/24.
//

import SwiftUI

@main
struct SlidingIntroApp: App {
    var body: some Scene {
        WindowGroup {
            ContainerView().ignoresSafeArea() //Cambiamos a que aparezca primero el SplashScreen que el Sliding Intro
        }
    }
}
