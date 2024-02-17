//
//  ProfileView.swift
//  MyMealPal
//
//  Created by Ultiimate Dog on 19/02/24.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var modelData: ModelData = .shared
    
    var body: some View {
        GeometryReader { proxy in
            let dWidth = proxy.size.width
            let dHeight = proxy.size.height
            
            VStack {
                // Stack for the username and image
                HStack {
                    VStack {
                        HStack(spacing: 0) {
                            Text(modelData.profile.username + "   ").bold().font(.title2)
                            Text(String(modelData.profile.streakDays)).bold().font(.title2)
                            Image(systemName: "flame.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(height: dHeight*0.03)
                                .foregroundStyle(modelData.profile.GetStreakColor())
                                .padding(.leading, 2)
                        }
                        Divider()
                        VStack(spacing: 7) {
                            HStack {
                                Text("⏲️")
                                Spacer()
                                Text(String(modelData.profile.weight) + " Kg").bold().font(.title3)
                            }
                            //Spacer()
                            HStack {
                                Image(systemName: "ruler.fill").rotationEffect(.degrees(90))
                                Spacer()
                                Text(String(modelData.profile.height) + " m").bold().font(.title3)
                            }
                            //Spacer()
                            HStack {
                                Text("🔥")
                                Spacer()
                                Text(String(modelData.profile.kcalResting) + " Kcal").bold().font(.title3)
                            }
                        }
                        .padding(.horizontal, dWidth * 0.05)
                        .padding(.top, 10)
                    }
                    Image(systemName: "person.and.background.dotted")
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                }
                Divider()
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ProgressGidget(dWidth: dWidth)
                        ProgressGidget2(dWidth: dWidth)
                        ProgressGidget3(dWidth: dWidth)
                        ProgressGidget4(dWidth: dWidth)
                    }
                }
            }
            .padding(.top, 15)
            .background(RoundedRectangle(cornerRadius: dWidth * 0.0636).foregroundStyle(Color(UIColor.systemBackground)))
        }
    }
}

#Preview {
    ProfileView()
}
