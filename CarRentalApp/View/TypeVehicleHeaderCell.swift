//
//  TypeVehicleHeaderCell.swift
//  CarRentalApp
//
//  Created by Nazrin Sultanlı on 28.10.23.
//

import UIKit

class TypeVehicleHeaderCell: UICollectionViewCell {
    @IBOutlet weak var type: UILabel!
    
    @IBOutlet weak var backColor: UIView!
    
    @IBOutlet weak var count: UILabel!
    @IBOutlet weak var carImage: UIImageView!
    
    func setCell(type:String,count:Int, carImage:String){
        self.type.text = type
        self.backColor.backgroundColor = UIColor.white
        self.count.text = String(count)
        self.carImage.image = UIImage(named: carImage)
    }
    
    func selectedCell(){
        self.type.textColor = UIColor.white
        self.backColor.backgroundColor = UIColor.blue
        self.count.textColor = UIColor.white
    }
    
    func unSelectedCell(){
        self.type.textColor = UIColor.black
        self.backColor.backgroundColor = UIColor.white
        self.count.textColor = UIColor.gray
    }
}