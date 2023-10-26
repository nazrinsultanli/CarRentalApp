//
//  TypeVehicleCollCell.swift
//  CarRentalApp
//
//  Created by Nazrin Sultanlı on 24.10.23.
//

import UIKit

class TypeVehicleCollCell: UICollectionViewCell {
    
    
    @IBOutlet weak var vehicleImage: UIImageView!
    
    @IBOutlet weak var countVehicles: UILabel!
    @IBOutlet weak var typeVehicle: UILabel!
    
    func setTypeVehicleCollCell(vehicleImageName: String,typeVehicleName: String, countVehiclesNumber: String  ) {
        vehicleImage.image = UIImage(named: vehicleImageName)
        typeVehicle.text = typeVehicleName
        countVehicles.text = countVehiclesNumber
    }
}
