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
    @IBOutlet weak var myTableView: UITableView!
    let myRealm = try! Realm()

    @IBOutlet weak var typesOfVehiclesCollectionView: UICollectionView!
    
    @IBOutlet weak var vehiclesListCollectionView: UICollectionView!
    let typeVehicle = ["Standard", "Prestige", "SUV"]
    let imagesofVehicles = ["car_1", "car_2", "car_3"]
    var numVehicles = [Int]()
    var selectedItem = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = myRealm.configuration.fileURL{
            print(url)
        }
        fetch()
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.register(UINib(nibName: "TypeVehicleTableViewCell" , bundle: .main), forCellReuseIdentifier: "tableCell")
        
       
//        typesOfVehiclesCollectionView.delegate = self
//        typesOfVehiclesCollectionView.dataSource = self
//        vehiclesListCollectionView.delegate = self
//        vehiclesListCollectionView.dataSource = self
        
        var standartArray = [String]()
        var prestigeArray = [String]()
        var suvArray = [String]()
        var countStandart = 0
        var countPrestige = 0
        var countSUV = 0
        for i in 0..<carData.count{
            if carData[i].rentCost < 201{
                countStandart += 1
                standartArray.append(String(carData[i].rentCost))
            }
            else if carData[i].rentCost > 201 && carData[i].rentCost < 400 {
                countPrestige += 1
                prestigeArray.append(String(carData[i].rentCost))
            }
            else if carData[i].rentCost > 401 {
                countSUV += 1
                suvArray.append(String(carData[i].rentCost))
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

/*extension HomePageViewController: UICollectionViewDelegate, UICollectionViewDataSource {


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
*/


extension HomePageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else if section == 1 {
            return 1
        }
        else {
            return 5
        }
    }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            return UITableViewCell()
        }
        else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! TypeVehicleTableViewCell
            cell.myCollectionView.backgroundColor = .red
            return cell
        }
        else{
            return UITableViewCell()
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 40
        }
        else if indexPath.section == 1{
            return 130
        }
        else{
            return 40
        }
    }
}
