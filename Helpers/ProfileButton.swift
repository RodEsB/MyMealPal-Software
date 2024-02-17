//
//  SwiftUIView.swift
//  
//
//  Created by Ultiimate Dog on 15/02/24.
//

import SwiftUI

struct ProfileButton: View {
    @State var showProfile = false
    let dWidth: Double
    let dHeight: Double
    
    var body: some View {
        Button {
            self.showProfile.toggle()
        } label: {
            Image(systemName: "person.crop.circle")
                .resizable()
                .scaledToFit()
        }
        .sheet(isPresented: $showProfile) {
            ProfileView()
        }
    }
}

struct SearchButton: View {
    let dWidth: Double
    let dHeight: Double
    
    var body: some View {
        Button {
            // Shows a pop-up
        } label: {
            Image(systemName: "sparkle.magnifyingglass")
                .resizable()
                .scaledToFit()
        }
    }
}


#Preview {
    ProfileButton(dWidth: 300, dHeight: 700)
}
