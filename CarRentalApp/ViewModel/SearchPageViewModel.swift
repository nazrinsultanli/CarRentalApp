//
//  SearchPageViewModel;.swift
//  CarRentalApp
//
//  Created by Nazrin Sultanlı on 01.11.23.
//

import Foundation
class SearchPageViewModel{
    var selectedRow: Int = 0
    var carData = [Vehicles]()
    var filteredData = [Vehicles]()
    
    func fetchData() {
        carData = VehicleGenerator().carData
        filteredData = carData
    }
    
    
    
    func searchText (searchText: String){
        if searchText.isEmpty {
            filteredData = carData
        }
        else{
            filteredData = carData.filter {
                $0.brandName.lowercased().contains(searchText)
            }
        }
    }
}
