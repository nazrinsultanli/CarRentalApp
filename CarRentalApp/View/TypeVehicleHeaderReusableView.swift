//
//  TypeVehicleHeaderReusableView.swift
//  CarRentalApp
//
//  Created by Nazrin Sultanlı on 28.10.23.
//

import UIKit

class TypeVehicleHeaderReusableView: UICollectionReusableView {
    
    @IBOutlet weak var collectionViewm: UICollectionView!
    
    let typesOfVehicles = TypeVehiclesGenerator().types
}

extension TypeVehicleHeaderReusableView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        typesOfVehicles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewm.dequeueReusableCell(withReuseIdentifier: "TypeVehicleHeaderCell", for: indexPath) as! TypeVehicleHeaderCell
        cell.setCell(type: typesOfVehicles[indexPath.item].typeName, count: typesOfVehicles[indexPath.item].carCount, carImage: typesOfVehicles[indexPath.item].carImage)
        return cell
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 150, height: collectionViewm.frame.height)
    }
    
}

