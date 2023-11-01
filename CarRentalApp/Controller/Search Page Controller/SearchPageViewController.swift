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
    
    
    let viewModel = SearchPageViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewVehicles.dataSource = self
        collectionViewVehicles.delegate = self
        collectionViewVehicles.register(UINib(nibName: "\(VehicleListCollCellXIB.self)", bundle: nil), forCellWithReuseIdentifier: "VehicleListCollCellXIB")
        viewModel.fetchData()

//        view.backgroundColor = UIColor.systemGray6
    
    }
  
    @IBAction func searchButtonClicked(_ sender: Any) {
        guard let searchText = searchButton.text?.lowercased() else{
            return
        }
        
        viewModel.searchText(searchText: searchText)
        collectionViewVehicles.reloadData()
        
    }
}

extension SearchPageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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
}

extension SearchPageViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        searchButtonClicked(textField)
        return true
    }
}
