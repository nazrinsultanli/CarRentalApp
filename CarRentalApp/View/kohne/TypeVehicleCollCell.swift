//
//  TypeVehicleCollCell.swift
//  CarRentalApp
//
//  Created by Nazrin Sultanlı on 24.10.23.
//

import UIKit

class TypeVehicleCollCell: UICollectionViewCell {
    @IBOutlet weak var backgrounColorSelected: UIView!
    @IBOutlet weak var vehicleImage: UIImageView!
    
    @IBOutlet weak var countVehicles: UILabel!
    @IBOutlet weak var typeVehicle: UILabel!
    
    
    func setTypeVehicleCollCell(vehicleImageName: String,typeVehicleName: String, countVehiclesNumber: String) {
        vehicleImage.image = UIImage(named: vehicleImageName)
        typeVehicle.text = typeVehicleName
        countVehicles.text = countVehiclesNumber
        backgrounColorSelected.tintColor = UIColor.blue
        backgrounColorSelected.layer.cornerRadius = backgrounColorSelected.frame.size.height/4
        
        //searchButton.layer.borderWidth = 0.5
    }
}
