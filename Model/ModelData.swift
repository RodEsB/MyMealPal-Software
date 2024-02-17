//
//  ModelData.swift
//  
//
//  Created by Ultiimate Dog on 19/02/24.
//

import SwiftUI
import RealityKit
import CoreML
import Vision
import SceneKit
import ARKit

// create and observable object that structs can access
class ModelData: ObservableObject {
    private init() { }
    
    static let shared = ModelData()
    
    // I use an AR view becuase it takes all the screen and also i wanted to implement AR but i couldn´t
    @Published var ARview = ARView()
    @Published var foodIndex = -1
    // Creates a default profile
    @Published var profile = Profile.default
    
    // instantiate the core ML model
    @Published var model  = try! VNCoreMLModel(for: Food_Ident_Model(configuration: .init()).model)
    
    // call the continuouslyUpdate function every half second
    var timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { _ in
        continuouslyUpdate()
    })
    
    func setFoodIndex(index: Int) {
        foodIndex = index
    }
}
