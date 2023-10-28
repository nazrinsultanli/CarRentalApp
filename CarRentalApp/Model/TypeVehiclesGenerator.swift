//
//  TypeVehiclesGenerator.swift
//  CarRentalApp
//
//  Created by Nazrin Sultanlı on 28.10.23.
//

import Foundation
import RealmSwift
class TypeVehiclesGenerator {
    
    var types: [TypeVehicles]  {
        return generatedCarTypes()
    }
    
    func generatedCarTypes() -> [TypeVehicles]  {
        //var carData = [Vehicles]()
        
        var carData = VehicleGenerator().carData
        
        var countStandart = 0
        var countPrestige = 0
        var countSUV = 0
        for i in 0..<carData.count{
            if carData[i].rentCost < 200{
                countStandart += 1
                
            }
            else if carData[i].rentCost >= 200 && carData[i].rentCost < 400 {
                countPrestige += 1
                
            }
            else if carData[i].rentCost > 401 {
                countSUV += 1
                
            }
        }
        
        var types = [TypeVehicles(typeName: "Standard",
                                  carImage: "car_1",
                                  carCount: countStandart ),
                     TypeVehicles(typeName: "Prestige",
                                  carImage: "car_2",
                                  carCount: countPrestige),
                     TypeVehicles(typeName: "SUV",
                                  carImage: "car_3",
                                  carCount: countSUV) ]
        
        return types
    }
    
    
    
    
    
    
}

