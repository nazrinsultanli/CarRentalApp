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
    @IBOutlet weak var searchButton: UITextField!
    var carData = [Vehicles]()
    let myRealm = try! Realm()
    
    @IBOutlet weak var typesOfVehiclesCollectionView: UICollectionView!
    
    @IBOutlet weak var vehiclesListCollectionView: UICollectionView!
    
    let typeVehicle = ["Standard", "Prestige", "SUV"]
    let imagesofVehicles = ["car_1", "car_2", "car_3"]
    var numVehicles = [Int]()
    var filteredData: [Vehicles] = []
    
    var standartArray : [Vehicles] = []
    var prestigeArray: [Vehicles] = []
    var suvArray: [Vehicles] = []
    
    
    
    
    
    var selectedIndexPath: IndexPath? // type uzerinde didselect
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            // Select the first item in the first collection view
            let firstIndexPath = IndexPath(item: 0, section: 0)
        typesOfVehiclesCollectionView.selectItem(at: firstIndexPath, animated: false, scrollPosition: .top)
            collectionView(typesOfVehiclesCollectionView, didSelectItemAt: firstIndexPath)
        navigationController?.setNavigationBarHidden(false, animated: true)

        }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = myRealm.configuration.fileURL{
            print(url)
        }
        fetch()
        numVehicles = numberOfVehicles()
        searchButton.delegate = self
        typesOfVehiclesCollectionView.backgroundColor = UIColor.clear

        vehiclesListCollectionView.register(UINib(nibName: "VehicleListCollCellXIB" , bundle: .main), forCellWithReuseIdentifier: "VehicleListCell")
    
        typesOfVehiclesCollectionView.delegate = self
        typesOfVehiclesCollectionView.dataSource = self
        vehiclesListCollectionView.delegate = self
        vehiclesListCollectionView.dataSource = self
        
        navigationController?.navigationBar.barTintColor = UIColor.white
        tabBarController?.tabBar.barTintColor = UIColor.white
        vehiclesListCollectionView.layer.cornerRadius = vehiclesListCollectionView.frame.size.height/8

        
        view.backgroundColor = UIColor.systemGray6
        
        searchButton.layer.cornerRadius = searchButton.frame.size.height/2
        searchButton.layer.masksToBounds = true
        //searchButton.layer.borderWidth = 0.5
        
        
    }
    
    func numberOfVehicles() -> [Int] {
        var countStandart = 0
        var countPrestige = 0
        var countSUV = 0
        for i in 0..<carData.count{
            if carData[i].rentCost < 201{
                countStandart += 1
                standartArray.append((carData[i]))
            }
            else if carData[i].rentCost > 201 && carData[i].rentCost < 400 {
                countPrestige += 1
                prestigeArray.append((carData[i]))
            }
            else if carData[i].rentCost > 401 {
                countSUV += 1
                suvArray.append((carData[i]))
            }
        }
        
        return [countStandart,countPrestige,countSUV]
    }
    
    func fetch(){
        let data = myRealm.objects(Vehicles.self)
        carData.removeAll()
        carData.append(contentsOf: data)
        //myTableView.reloadData()
    }
    
    
    @IBAction func searchButtonClicked(_ sender: Any) {
        guard let searchText = searchButton.text?.lowercased() else{
            return
        }
        filteredData = carData.filter { $0.brandName.lowercased().contains(searchText)
        }
        vehiclesListCollectionView.reloadData()
    }
}

extension HomePageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.typesOfVehiclesCollectionView {
            return typeVehicles.allCases.count
        }
        if collectionView == self.vehiclesListCollectionView{
            return filteredData.count
        }
        
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        if collectionView == self.vehiclesListCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VehicleListCell", for: indexPath as IndexPath) as! VehicleListCollCellXIB
            cell.setVehicleListCollCell(liter: filteredData[indexPath.item].brandName,
                                        cost: String(filteredData[indexPath.item].rentCost),
                                        engine: filteredData[indexPath.item].motor,
                                        model: filteredData[indexPath.item].modelName,
                                        brand: filteredData[indexPath.item].brandName,
                                        image: filteredData[indexPath.item].imageName)
            return cell
        }
        
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TypeVehicleCollCell", for: indexPath as IndexPath) as! TypeVehicleCollCell
            cell.setTypeVehicleCollCell(vehicleImageName: imagesofVehicles[indexPath.item], typeVehicleName: typeVehicle[indexPath.item], countVehiclesNumber: String(numVehicles[indexPath.item]))
            return cell
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.typesOfVehiclesCollectionView {
            
     
            let cell = collectionView.cellForItem(at: indexPath) as? TypeVehicleCollCell
                    
                    // Reset background color of all cells to clear
            if let selectedIndexPath = selectedIndexPath,
                           let previousCell = collectionView.cellForItem(at: selectedIndexPath) as? TypeVehicleCollCell {
                            previousCell.backgrounColorSelected.backgroundColor = UIColor.white
                previousCell.countVehicles.textColor = UIColor.black
                previousCell.typeVehicle.textColor = UIColor.black
                
                
                        }
                    
                    // Set the background color of the selected cell to blue
            cell?.backgrounColorSelected.backgroundColor = UIColor.blue
            cell?.countVehicles.textColor = UIColor.white
            cell?.typeVehicle.textColor = UIColor.white
            selectedIndexPath = indexPath
            
            
            switch (indexPath.item) {
            case 0:
                filteredData = standartArray
            case 1:
                filteredData = prestigeArray
            case 2:
                filteredData = suvArray
            default:
                print("")
                break
            }
            vehiclesListCollectionView.reloadData()
            
            
        }
    }
    
}


extension HomePageViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        searchButtonClicked(textField)
        return true
    }
}

