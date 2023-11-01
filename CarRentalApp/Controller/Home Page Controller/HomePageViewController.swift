//
//  HomePageViewController.swift
//  CarRentalApp
//
//  Created by Nazrin Sultanlı on 21.10.23.
//

import UIKit



class HomePageViewController: UIViewController {
    @IBOutlet weak var searchButton: UITextField!
    @IBOutlet weak var collectionViewVehicles: UICollectionView!
    
    let viewModel = HomePageViewModel()
    
    //header-----xib
    //    typesOfVehiclesCollectionView.register(UINib(data: "\(dsjkb.self)", bundle: nil),
    //                                           forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "dsff")
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchButton.layer.borderColor = UIColor.white.cgColor
        searchButton.layer.borderWidth = 1.0
        
        viewModel.filteredCarData(selectedFromType: .standart)
        collectionViewVehicles.register(UINib(nibName: "\(VehicleListCollCellXIB.self)", bundle: nil), forCellWithReuseIdentifier: "VehicleListCollCellXIB")
        
        searchButton.delegate = self
    }
    
    @IBAction func searchButtonClicked(_ sender: Any) {
        guard let searchText = searchButton.text?.lowercased() else{
            return
        }
        viewModel.searcText(searchText: searchText)
        collectionViewVehicles.reloadData()
    }
}

extension HomePageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.filteredData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(VehicleListCollCellXIB.self)", for: indexPath) as! VehicleListCollCellXIB
        cell.setVehicleListCollCell(liter: viewModel.filteredData[indexPath.item].brandName,
                                    cost: String(viewModel.filteredData[indexPath.item].rentCost),
                                    engine: viewModel.filteredData[indexPath.item].motor,
                                    model: viewModel.filteredData[indexPath.item].modelName,
                                    brand: viewModel.filteredData[indexPath.item].brandName,
                                    image: viewModel.filteredData[indexPath.item].imageName)
        cell.layer.cornerRadius = 30
        return cell
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width * 0.855, height: 355)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "\(TypeVehicleHeaderReusableView.self)", for: indexPath) as! TypeVehicleHeaderReusableView
        
        header.selectedCategoryforHome = { type in
//            self.viewModel.selectedFromType = type
            self.viewModel.filteredCarData(selectedFromType: type)
            self.collectionViewVehicles.reloadData()
        }
        
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

