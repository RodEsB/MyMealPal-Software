//
//  SwiftUIView.swift
//  
//
//  Created by Ultiimate Dog on 17/02/24.
//

import SwiftUI

struct InfoDisplayer: View {
    @ObservedObject var modelData: ModelData = .shared
    @State var meal: FoodInfo
    @State var change = 100
    let dWidth: Double
    let dHeight: Double
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    modelData.setFoodIndex(index: -1)
                } label: {
                    Image(systemName: "clear")
                        .resizable()
                        .scaledToFit()
                        .padding(.leading, 10)
                        .foregroundStyle(Color.red)
                }
                .frame(height: dHeight*0.04)
                Spacer()
                Text(meal.name).bold().font(.title)
                Spacer()
                Button {
                    modelData.profile.AddMeal(meal: meal)
                } label: {
                    Image(systemName: "plus.square")
                        .resizable()
                        .scaledToFit()
                        .padding(.trailing, 10)
                }
                .frame(height: dHeight*0.04)
            }
            Divider()
            HStack {
                Text("Quantity ⏲️").bold().frame(width: dWidth*0.4)
                Divider()
                Spacer()
                TextField("In gr", value: $change, format: .number)
                    .font(.title2)
                    .bold()
                    .multilineTextAlignment(.center)
                    .onSubmit() {
                        if change <= 0 {
                            change = meal.grams
                        }
                        meal.changeGrams(newGrams: change)
                    }
                Spacer()
            }
            Divider()
            HStack {
                Text("Calories 🔥").bold().frame(width: dWidth*0.4)
                Divider()
                Spacer()
                Text(String(meal.kcal)).font(.title2).bold()
                Spacer()
            }
            Divider()
            HStack {
                Text("Proteins 🍗").bold().frame(width: dWidth*0.4)
                Divider()
                Spacer()
                Text(String(meal.protein) + " gr").font(.title2).bold()
                Spacer()
            }
            Divider()
            HStack {
                Text("Carbohydrates 🍞").bold().frame(width: dWidth*0.4)
                Divider()
                Spacer()
                Text(String(meal.carbs) + " gr").font(.title2).bold()
                Spacer()
            }
            Divider()
            HStack {
                Text("Sugar").foregroundColor(Color.gray).bold().frame(width: dWidth*0.4)
                Divider()
                Spacer()
                Text(String(meal.sugar) + " gr").font(.title3).foregroundColor(Color.gray).bold().italic()
                Spacer()
            }
            Divider()
            HStack {
                Text("Fats 🥑").bold().frame(width: dWidth*0.4)
                Divider()
                Spacer()
                Text(String(meal.fats) + " gr").font(.title2).bold()
                Spacer()
            }
            Divider()
            HStack {
                Text("Saturated Fats").foregroundColor(Color.gray).bold().frame(width: dWidth*0.4)
                Divider()
                Spacer()
                Text(String(meal.saturatedFat) + " gr").font(.title3).foregroundColor(Color.gray).bold().italic()
                Spacer()
            }
            Divider()
            HStack {
                Text("Unsaturated Fats").foregroundColor(Color.gray).bold().frame(width: dWidth*0.4)
                Divider()
                Spacer()
                Text(String(meal.unsaturatedFat) + " gr").font(.title3).foregroundColor(Color.gray).bold().italic()
                Spacer()
            }
            Divider()
            HStack {
                Text("Trans Fats").foregroundColor(Color.gray).bold().frame(width: dWidth*0.4)
                Divider()
                Spacer()
                Text(String(meal.transFat) + " gr").font(.title3).foregroundColor(Color.gray).bold().italic()
                Spacer()
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: dWidth * 0.0636).foregroundStyle(Color(UIColor.systemBackground)).opacity(0.7))
    }
}

#Preview {
    InfoDisplayer(meal: FoodInfo(name: "Hamburguer",
                                 kcal: 400,
                                 protein: 20,
                                 carbs: 45,
                                 sugar: 15,
                                 fats: 35,
                                 saturatedFat: 15,
                                 unsaturatedFat: 10,
                                 transFat: 10), dWidth: 300, dHeight: 700)
}
