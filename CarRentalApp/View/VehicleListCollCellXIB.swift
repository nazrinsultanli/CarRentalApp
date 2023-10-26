//
//  VehicleListCollCellXIB.swift
//  CarRentalApp
//
//  Created by Nazrin Sultanlı on 27.10.23.
//

import UIKit

class VehicleListCollCellXIB: UICollectionViewCell {

    @IBOutlet weak var liter: UILabel!
    @IBOutlet weak var cost: UILabel!
    @IBOutlet weak var engine: UILabel!
    @IBOutlet weak var modelType: UILabel!
    @IBOutlet weak var modelNAme: UILabel!
    @IBOutlet weak var carImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    func setVehicleListCollCell(liter: String, cost: String, engine: String, model: String, brand: String, image: String){
        carImage.image = UIImage(named: image)
        modelNAme.text = brand
        modelType.text = model
        modelType.text = engine
        self.cost.text = "$\(cost)"
        self.liter.text = liter
        
     
    }

}
