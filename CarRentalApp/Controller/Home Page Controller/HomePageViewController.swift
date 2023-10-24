//
//  HomePageViewController.swift
//  CarRentalApp
//
//  Created by Nazrin Sultanlı on 21.10.23.
//

import UIKit
import RealmSwift

enum typeVehicles: String,  CaseIterable{
    case standard = "Standard"
    case prestige = "Prestige"
    case suv = "SUV"
}

//switch(HomeItems.allCases[indexPath.row]) {case .standar:}
class HomePageViewController: UIViewController {
    var carData = [Vehicles]()
    let myRealm = try! Realm()

    @IBOutlet weak var typesOfVehiclesCollectionView: UICollectionView!
    
    @IBOutlet weak var vehiclesListCollectionView: UICollectionView!
    let typeVehicle = ["Standard", "Prestige", "SUV"]
    let imagesofVehicles = ["car_1", "car_2", "car_3"]
    var numVehicles = [Int]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = myRealm.configuration.fileURL{
            print(url)
        }
        fetch()
        
       
        typesOfVehiclesCollectionView.delegate = self
        typesOfVehiclesCollectionView.dataSource = self
        vehiclesListCollectionView.delegate = self
        vehiclesListCollectionView.dataSource = self
        
        
        var countStandart = 0
        var countPrestige = 0
        var countSUV = 0
        for i in 0..<carData.count{
            if carData[i].rentCost < 201{
                countStandart += 1
            }
            else if carData[i].rentCost > 201 && carData[i].rentCost < 400 {
                countPrestige += 1
            }
            else if carData[i].rentCost > 401 {
                countSUV += 1
            }
        }
        numVehicles = [countStandart,countPrestige,countSUV]
        

    }
    
    func fetch(){
        let data = myRealm.objects(Vehicles.self)
        carData.removeAll()
        carData.append(contentsOf: data)
        //myTableView.reloadData()
    }

}

extension HomePageViewController: UICollectionViewDelegate, UICollectionViewDataSource {


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.typesOfVehiclesCollectionView {
            return typeVehicles.allCases.count
        }

        return carData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        if collectionView == self.vehiclesListCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VehicleListCollCell", for: indexPath as IndexPath) as! VehicleListCollCell
            cell.setVehicleListCollCell(liter: carData[indexPath.item].brandName,
                                        cost: String(carData[indexPath.item].rentCost),
                                        engine: carData[indexPath.item].motor,
                                        model: carData[indexPath.item].modelName,
                                        brand: carData[indexPath.item].brandName,
                                        image: carData[indexPath.item].imageName)
            return cell
        }
        
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TypeVehicleCollCell", for: indexPath as IndexPath) as! TypeVehicleCollCell
            cell.setTypeVehicleCollCell(vehicleImageName: imagesofVehicles[indexPath.item], typeVehicleName: typeVehicle[indexPath.item], countVehiclesNumber: String(numVehicles[indexPath.item]))
            return cell
        }

    }
    
 
    
}
