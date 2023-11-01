//
//  VehicleGenerator.swift
//  CarRentalApp
//
//  Created by Nazrin Sultanlı on 27.10.23.
//

import Foundation
import RealmSwift
class VehicleGenerator {
    let myRealm = try! Realm()
    var carData = [Vehicles(brandName: "Toyota",
                            modelName: "Pirius",
                            rentCost: 100,
                            motor: "engine",
                            speed: "1212",
                            imageName: "car_1",
                            categoryType: .standart),
                   Vehicles(brandName: "Mercedes",
                            modelName: "GLE",
                            rentCost: 250,
                            motor: "engine",
                            speed: "1212",
                            imageName: "car_2",
                            categoryType: .prestige),
                   Vehicles(brandName: "Porche",
                            modelName: "panamera",
                            rentCost: 450,
                            motor: "engine",
                            speed: "1212",
                            imageName: "car_3",
                            categoryType: .suv),
    ]
    
    
    func saveItems() {
        do{
            try myRealm.write{
                myRealm.add(carData)
                fetch()
                //                items.append(item)
                //                myTableView.reloadData()
                //                myTableView.insertRows(at: [IndexPath(row: itemsss.count-1, section: 0)], with: .fade)
            }
        } catch{
            print(error.localizedDescription)
        }
    }
    
    func fetch(){
        let data = myRealm.objects(Vehicles.self)
        carData.removeAll()
        carData.append(contentsOf: data)
        //vehiclesListCollectionView.reloadData()
    }
    
}
