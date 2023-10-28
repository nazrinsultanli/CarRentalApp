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
    
    var selectedIndexforHome: ((Int) -> Void)?
    
    var selectedIndexPath: IndexPath?
    
    
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
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndexforHome?(tag)
        
            let cell = collectionViewm.cellForItem(at: indexPath) as? TypeVehicleHeaderCell

                    // Reset background color of all cells to clear
            if let selectedIndexPath = selectedIndexPath,
                           let previousCell = collectionViewm.cellForItem(at: selectedIndexPath) as? TypeVehicleHeaderCell {
                previousCell.selectedCell()
                        }
        cell?.unSelectedCell()
            selectedIndexPath = indexPath

        collectionViewm.reloadData()

    }
    
}

