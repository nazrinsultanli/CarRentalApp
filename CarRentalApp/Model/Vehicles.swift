//
//  Vehicles.swift
//  CarRentalApp
//
//  Created by Nazrin Sultanlı on 24.10.23.
//

import Foundation
import RealmSwift

class Vehicles: Object{
    @Persisted var brandName: String
    @Persisted var modelName: String
    @Persisted var rentCost: Int
    @Persisted var motor: String
    @Persisted var speed: String
    @Persisted var imageName: String
    
    convenience init(brandName: String, modelName: String, rentCost: Int, motor: String, speed: String, imageName: String) {
        self.init()
        self.brandName = brandName
        self.modelName = modelName
        self.rentCost = rentCost
        self.motor = motor
        self.speed = speed
        self.imageName = imageName
    }
}


