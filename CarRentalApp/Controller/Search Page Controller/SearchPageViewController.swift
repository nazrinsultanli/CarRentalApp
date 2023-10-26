//
//  SearchPageViewController.swift
//  CarRentalApp
//
//  Created by Nazrin Sultanlı on 21.10.23.
//

import UIKit
import RealmSwift

class SearchPageViewController: UIViewController {
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    @IBOutlet weak var searchButton: UITextField!
    var carData = [Vehicles]()
    let myRealm = try! Realm()
    var filteredData: [Vehicles] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetch()
        myCollectionView.reloadData()
        print("Number of items in carData: \(carData.count)")
        
        myCollectionView.register(UINib(nibName: "VehicleListCollCellXIB" , bundle: .main), forCellWithReuseIdentifier: "VehicleListCell")
        myCollectionView.backgroundColor = UIColor.clear
        myCollectionView.layer.cornerRadius = myCollectionView.frame.size.height/4
        //        filteredData = carData
    }
    
    
    
    //    @IBAction func searchButtonClicked(_ sender: Any) {
    //        guard let searchText = searchButton.text?.lowercased() else{
    //            return
    //        }
    //        filteredData = carData.filter { $0.brandName.lowercased().contains(searchText)
    //        }
    //        myCollectionView.reloadData()
    //    }
    
    func fetch(){
        let data = myRealm.objects(Vehicles.self)
        carData.removeAll()
        carData.append(contentsOf: data)
        //myTableView.reloadData()
    }
    
    
}

extension SearchPageViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //print("Number of Items: \(filteredData.count)")
        //return filteredData.count
        return carData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("Filtered Data Count: \(filteredData.count)")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VehicleListCell", for: indexPath as IndexPath) as! VehicleListCollCellXIB
//        cell.setVehicleListCollCell(liter: filteredData[indexPath.item].brandName,
//                                    cost: String(filteredData[indexPath.item].rentCost),
//                                    engine: filteredData[indexPath.item].motor,
//                                    model: filteredData[indexPath.item].modelName,
//                                    brand: filteredData[indexPath.item].brandName,
//                                    image: filteredData[indexPath.item].imageName)
        
     
            // Use carData instead of filteredData to populate the cell
            cell.setVehicleListCollCell(liter: carData[indexPath.item].brandName,
                                        cost: String(carData[indexPath.item].rentCost),
                                        engine: carData[indexPath.item].motor,
                                        model: carData[indexPath.item].modelName,
                                        brand: carData[indexPath.item].brandName,
                                        image: carData[indexPath.item].imageName)
      
        return cell
    }
    
    
}

//extension SearchPageViewController: UITextFieldDelegate {
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        searchButtonClicked(textField)
//        return true
//    }
//}
