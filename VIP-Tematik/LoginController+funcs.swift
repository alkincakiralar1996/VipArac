//
//  LoginController+funcs.swift
//  VIP-Tematik
//
//  Created by Macintosh HD on 02/08/2017.
//  Copyright © 2017 Macintosh HD. All rights reserved.
//

import UIKit

extension LoginViewController{
    
    func handleLicenceConfirm(){
        guard let licenceNo : String = licenceNumberTextField.text,let password : String = passwordNumberTextField.text else{
            print("girilen degeler uygun degil")
            spinner.isHidden = true
            return
        }
        
        let textFieldsArray = [licenceNo,password]
        let errorMessagesArray = ["Lisans numarasi bos gecilemez","Sifre bolumu bos gecilemez"]
        
        if let state : Bool = alertControl(texts: textFieldsArray, errorMessages: errorMessagesArray){
            if !state {
                return
            }
            
            userModel.licenceNo = licenceNo
            userModel.password = password
            
            if let controlState : Bool = userFuncs.loginControl(user: userModel){
                if !controlState{
                    alert(message: "Giris basarisiz.Lutfen bilgilerinizi kontrol edin.")
                    spinner.isHidden = true
                    return
                }
                passHomePage()
            }
        }
    }
    
    func passHomePage(){
        let homePage = HomeViewController()
        present(homePage, animated: true, completion: nil)
    }
    
    func handleSystemConfirm(){
        
    }
    
    
    func startSettings(){
        licenceNumberTextField.becomeFirstResponder() // lisans textini uygulama acildiginda focuslancak halde ayarladik
        passwordNumberTextField.delegate = self
        licenceNumberTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.licenceNumberTextField{
            self.passwordNumberTextField.becomeFirstResponder()
        }
        else if textField == self.passwordNumberTextField{
            self.view.endEditing(true)
        }
        return true
    }
    
    func setAllComponentSettings(){
        //VIEW SETTINGS
        self.view.backgroundColor = UIColor.black
        
        //TOP VIEW SETTINGS
        view.addSubview(topView) // sayfaya componenti eklemek istedigimiz zaman bu metodla ekliyoruz
        self.topView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true // top view'imizi status barin hemen altina sabitledik
        topView.widthAnchor.constraint(equalTo:view.widthAnchor).isActive = true // genisligini sayfanin genisligine esitledik
        topView.heightAnchor.constraint(equalToConstant: 23).isActive = true // yuksekliginin kac px olcagini belirttik
        
        //TOP VIEW LABEL SETTINGS
        topView.addSubview(topViewLabel) // label olusturdugumuz top view componentinin icinde olacagi icin view'a degil topview componentinin icine ekledik
        topViewLabel.leftAnchor.constraint(equalTo: topView.leftAnchor,constant:5).isActive = true // top view'in icinde soldan mesafesini belirledik
        topViewLabel.centerYAnchor.constraint(equalTo: topView.centerYAnchor).isActive = true // top view'in yuksekligine gore yukardan asagiya ortaladak
        
        //LICENCE NUMBER LABEL SETTINGS
        view.addSubview(licenceNumberLabel)
        licenceNumberLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        licenceNumberLabel.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 5).isActive = true
        
        //LICENCE NUMBER TEXT FIELD SETTINGS
        view.addSubview(licenceNumberTextField)
        licenceNumberTextField.leftAnchor.constraint(equalTo: licenceNumberLabel.leftAnchor).isActive = true
        licenceNumberTextField.topAnchor.constraint(equalTo: licenceNumberLabel.bottomAnchor,constant:5).isActive = true
        licenceNumberTextField.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        licenceNumberTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        //PASSWORD LABEL SETTINGS
        view.addSubview(passwordNumberLabel)
        passwordNumberLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        passwordNumberLabel.topAnchor.constraint(equalTo: licenceNumberTextField.bottomAnchor, constant: 10).isActive = true
        
        //PASSWORD TEXT FIELD SETTINGS
        view.addSubview(passwordNumberTextField)
        passwordNumberTextField.leftAnchor.constraint(equalTo: passwordNumberLabel.leftAnchor).isActive = true
        passwordNumberTextField.topAnchor.constraint(equalTo: passwordNumberLabel.bottomAnchor,constant:5).isActive = true
        passwordNumberTextField.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        passwordNumberTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        //LICENCE CONFIRM BUTTON SETTINGS
        view.addSubview(licenceConfirmButton)
        licenceConfirmButton.topAnchor.constraint(equalTo: passwordNumberTextField.bottomAnchor, constant: 10).isActive = true
        licenceConfirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        licenceConfirmButton.widthAnchor.constraint(equalTo:view.widthAnchor,constant:-20).isActive = true
        licenceConfirmButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //SYSTEM READY BUTTON SETTINGS
        view.addSubview(systemReadyButton)
        systemReadyButton.topAnchor.constraint(equalTo: licenceConfirmButton.bottomAnchor, constant: 10).isActive = true
        systemReadyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        systemReadyButton.widthAnchor.constraint(equalTo:view.widthAnchor,constant:-20).isActive = true
        systemReadyButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //SPINNER SETTINGS
        view.addSubview(spinner)
        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }
    
}
