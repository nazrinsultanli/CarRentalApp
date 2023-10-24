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
}
