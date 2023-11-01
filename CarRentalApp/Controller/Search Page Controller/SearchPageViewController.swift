//
//  SearchPageViewController.swift
//  CarRentalApp
//
//  Created by Nazrin Sultanlı on 21.10.23.
//

import UIKit
import RealmSwift

class SearchPageViewController: UIViewController {
    @IBOutlet weak var collectionViewVehicles: UICollectionView!
    @IBOutlet weak var searchButton: UITextField!
    
    var carData = VehicleGenerator().carData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewVehicles.dataSource = self
        collectionViewVehicles.delegate = self
        collectionViewVehicles.register(UINib(nibName: "\(VehicleListCollCellXIB.self)", bundle: nil), forCellWithReuseIdentifier: "VehicleListCollCellXIB")
        

//        view.backgroundColor = UIColor.systemGray6
    
    }
  
    @IBAction func searchButtonClicked(_ sender: Any) {
        
    }
}

extension SearchPageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return carData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(VehicleListCollCellXIB.self)", for: indexPath) as! VehicleListCollCellXIB
        
        cell.setVehicleListCollCell(liter: carData[indexPath.item].brandName,
                                    cost: String(carData[indexPath.item].rentCost),
                                    engine: carData[indexPath.item].motor,
                                    model: carData[indexPath.item].modelName,
                                    brand: carData[indexPath.item].brandName,
                                    image: carData[indexPath.item].imageName)
        cell.layer.cornerRadius = 30
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width * 0.855, height: 355)
    }
}

//extension SearchPageViewController: UITextFieldDelegate {
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        searchButtonClicked(textField)
//        return true
//    }
//}
