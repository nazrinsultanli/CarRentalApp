//
//  LoginPageViewController.swift
//  CarRentalApp
//
//  Created by Nazrin Sultanlı on 21.10.23.
//

import UIKit

class LoginPageViewController: UIViewController {
    @IBOutlet weak var buttonView: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    
    private func setupUI(){
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "launchBackground")!)
        
        emailTextField.layer.cornerRadius = 25
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.borderColor = UIColor.white.cgColor
        
        passwordTextField.layer.cornerRadius = 25
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = UIColor.white.cgColor
        
        buttonView.layer.cornerRadius = 25
        buttonView.layer.borderWidth = 1
        //buttonView.layer.borderColor = UIColor.black.cgColor
        
        emailTextField.layer.masksToBounds = true
        passwordTextField.layer.masksToBounds = true
        buttonView.layer.masksToBounds = true
        
    }
    

    @IBAction func logInClicked(_ sender: Any) {
        let homeController = storyboard?.instantiateViewController(identifier: "tabBar") as! UITabBarController
        navigationController?.show(homeController, sender: nil)
    }
    

}
