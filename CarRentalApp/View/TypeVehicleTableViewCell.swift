//
//  TypeVehicleTableViewCell.swift
//  CarRentalApp
//
//  Created by Nazrin Sultanlı on 25.10.23.
//

import UIKit

class TypeVehicleTableViewCell: UITableViewCell {
 
    

    @IBOutlet weak var myCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        myCollectionView.register(UINib(nibName: "TypeVehicleCollectioninTableCell1", bundle: .main), forCellWithReuseIdentifier: "collectionCell")
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
       
    
    
}

extension TypeVehicleTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     12
 }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! TypeVehicleCollectioninTableCell1
        cell.vehicleImage.image = UIImage(named: "car_1")
        cell.typeName.text = "nazrin"
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width/2
        return CGSize(width: width, height: 120)
    }
    
}
