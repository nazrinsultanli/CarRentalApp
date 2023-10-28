//
//  TypeVehicles.swift
//  CarRentalApp
//
//  Created by Nazrin Sultanlı on 28.10.23.
//

import Foundation
import RealmSwift


class TypeVehicles: Object {
    @Persisted var typeName: String
    @Persisted var carImage: String
    @Persisted var carCount: Int
    
    convenience init(typeName: String, carImage: String, carCount: Int) {
        self.init()
        self.typeName = typeName
        self.carImage = carImage
        self.carCount = carCount
    }
}
