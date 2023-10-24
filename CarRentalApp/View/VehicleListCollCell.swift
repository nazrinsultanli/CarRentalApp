//
//  VehicleListCollCell.swift
//  CarRentalApp
//
//  Created by Nazrin Sultanlı on 24.10.23.
//

import UIKit

class VehicleListCollCell: UICollectionViewCell {
    
    @IBOutlet weak var liters: UILabel!
    @IBOutlet weak var costValue: UILabel!
    @IBOutlet weak var engineType: UILabel!
    @IBOutlet weak var modelName: UILabel!
    @IBOutlet weak var brandName: UILabel!
    @IBOutlet weak var carImage: UIImageView!
    
    func setVehicleListCollCell(liter: String, cost: String, engine: String, model: String, brand: String, image: String){
        carImage.image = UIImage(named: image)
        brandName.text = brand
        modelName.text = model
        engineType.text = engine
        costValue.text = cost
        liters.text = liter
    }
}
