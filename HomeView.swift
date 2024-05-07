//
//  HomeView.swift
//  MealPal
//
//  Created by Ultiimate Dog on 11/02/24.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        
        // Geometry needed to get the device dimensions
        GeometryReader { proxy in
            let dHeight = proxy.size.height
            let dWidth = proxy.size.width
            // Needed to navigate between views with buttons
            NavigationStack {
                ZStack {
                    // Background of the app
                    /*
                    Rectangle()
                        .fill(
                            LinearGradient(colors: [Color.yellow, Color.white], startPoint: .top, endPoint: .center)
                        )
                        .ignoresSafeArea()*/
                    //
                    VStack(spacing: 0) {
                        // Creates the toolbar
                        HStack {
                            SearchButton(dWidth: dWidth, dHeight: dHeight)
                            Spacer()
                            ProfileButton(dWidth: dWidth, dHeight: dHeight)
                        }
                        .frame(width: dWidth*0.90, height: dHeight*0.04)
                        // END toolbar
                        // Connects to the view that scans the food
                        NavigationLink {
                            FoodModelView().ignoresSafeArea()
                        } label: {
                            FoodIdentiferButton(dWidth: dWidth)
                        }
                        // END NavigationLink
                        HStack(spacing: 0) {
                            ProgressGidget(dWidth: dWidth)
                            CalendarGidget(dWidth: dWidth)
                        }
                        Spacer(minLength: 5)
                        // Creates the scrollView for the recommendations
                        ZStack {
                            QuickAddFrame(dWidth: dWidth, dHeight: dHeight)
                            
                            ScrollView {
                                VStack(spacing: 0) {
                                    Spacer(minLength: 5)
                                    QuickAddButton(dWidth: dWidth, dHeight: dHeight)
                                    QuickAddButton(dWidth: dWidth, dHeight: dHeight)
                                }
                            }
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: dWidth * 0.0636, style: .continuous))
                            .padding(.vertical)
                        }
                        // END ZStack
                }
                }
                .frame(width: dWidth, height: dHeight, alignment: .top)
            }
            // END Navigation
        }
        // END Geometry
    }
}

// This is for the frame of the recommendations
struct QuickAddFrame: View {
    let dWidth: Double
    let dHeight: Double

    //agregue mejor vista
    var body: some View {
        Rectangle()
            .fill(Color.green)
            .cornerRadius(dWidth * 0.0636)
            .frame( width: dWidth*96 / 100)
    }
}

// These lines are used to maintain the slide feature to go back to another view
extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
// END

#Preview {
    GuideView()
}
