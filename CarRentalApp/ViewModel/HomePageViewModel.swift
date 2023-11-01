//
//  RealmViewModel.swift
//  CarRentalApp
//
//  Created by Nazrin Sultanlı on 01.11.23.
//

import Foundation

class HomePageViewModel {
    var carData = VehicleGenerator().carData
    var filteredData: [Vehicles] = []
    
    func filteredCarData(selectedFromType: CetegoryCar) {
        filteredData = carData.filter({ $0.categoryType == selectedFromType })
    }
    
    func searcText(searchText: String) {
        if searchText.isEmpty {
            filteredData = carData
        }
        else{
            filteredData = carData.filter { $0.brandName.lowercased().contains(searchText)
                
            }
        }
    }
}
