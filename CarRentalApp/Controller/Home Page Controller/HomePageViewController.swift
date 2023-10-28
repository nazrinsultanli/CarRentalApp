//
//  HomePageViewController.swift
//  CarRentalApp
//
//  Created by Nazrin Sultanlı on 21.10.23.
//

import UIKit



class HomePageViewController: UIViewController {
    
    @IBOutlet weak var searchButton: UITextField!
    var carData = VehicleGenerator().carData
    @IBOutlet weak var collectionViewVehicles: UICollectionView!
    
    var selectedIndexforHome: ((Int) -> Void)?
    var selectedFromType: Int = 0
    
    var filteredData: [Vehicles] = []
    
    var standartArray : [Vehicles] = []
    var prestigeArray: [Vehicles] = []
    var suvArray: [Vehicles] = []
    
    //header-----xib
//    typesOfVehiclesCollectionView.register(UINib(data: "\(dsjkb.self)", bundle: nil),
//                                           forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "dsff")
    
    
    
//    override func viewWillAppear(_ animated: Bool) {
//            super.viewWillAppear(animated)
//     super.viewWillAppear(animated)       // Select the first item in the first collection view
//            let firstIndexPath = IndexPath(item: 0, section: 0)
//        collectionViewVehicles.selectItem(at: firstIndexPath, animated: false, scrollPosition: .top)
//            collectionView(collectionViewVehicles, didSelectItemAt: firstIndexPath)
//        navigationController?.setNavigationBarHidden(false, animated: true)
//
//        }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filteredCarData()
        collectionViewVehicles.register(UINib(nibName: "\(VehicleListCollCellXIB.self)", bundle: nil), forCellWithReuseIdentifier: "VehicleListCollCellXIB")
    
       
        
        searchButton.delegate = self

     navigationController?.navigationBar.barTintColor = UIColor.white
        tabBarController?.tabBar.barTintColor = UIColor.white
        view.backgroundColor = UIColor.systemGray6

        
    }

 
    
    @IBAction func searchButtonClicked(_ sender: Any) {
        guard let searchText = searchButton.text?.lowercased() else{
            return
        }
        filteredData = carData.filter { $0.brandName.lowercased().contains(searchText)
        }
        collectionViewVehicles.reloadData()
    }
    
    func filteredCarData() {
        if carData.contains(where: { $0.rentCost <= 200 }) {
            standartArray = carData
        } else if (carData.contains(where: { $0.rentCost > 200 && $0.rentCost <= 400 })) {
             prestigeArray = carData
        }
        else if (carData.contains(where: { $0.rentCost > 400 && $0.rentCost > 200 })) {
             suvArray = carData
        }
      
     
        
        selectedIndexforHome = { i in
            self.selectedFromType = i
            }
        switch selectedFromType {
        case 0:
            filteredData = standartArray
        case 1:
            filteredData = prestigeArray
        case 2:
            filteredData = prestigeArray
        default:
            filteredData = []
        }
    }
    
}

extension HomePageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return filteredData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(VehicleListCollCellXIB.self)", for: indexPath) as! VehicleListCollCellXIB
        
       
        cell.setVehicleListCollCell(liter: filteredData[indexPath.item].brandName,
                                    cost: String(filteredData[indexPath.item].rentCost),
                                    engine: filteredData[indexPath.item].motor,
                                    model: filteredData[indexPath.item].modelName,
                                    brand: filteredData[indexPath.item].brandName,
                                    image: filteredData[indexPath.item].imageName)
        cell.layer.cornerRadius = 30
        return cell
        
 
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width * 0.855, height: 355)
    }
    
    

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "\(TypeVehicleHeaderReusableView.self)", for: indexPath) as! TypeVehicleHeaderReusableView
        return header
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        .init(width: collectionView.frame.width, height: 160)
    }
}


extension HomePageViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        searchButtonClicked(textField)
        
        return true
    }
}

