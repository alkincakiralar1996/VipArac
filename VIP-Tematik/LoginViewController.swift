//
//  ViewController.swift
//  VIP-Tematik
//
//  Created by Macintosh HD on 02/08/2017.
//  Copyright © 2017 Macintosh HD. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    let topView : UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false // constraint kodlarini aktif edebilmemiz icin false yapmamiz gerek
        view.backgroundColor = UIColor.gray
        return view
    }()
    
    let topViewLabel : UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Tematik Smart Home"
        lbl.textColor = UIColor.white
        lbl.font = UIFont.systemFont(ofSize: 13, weight: 15) // ilk parametre text size ikinci parametre kalinlik
        return lbl
    }()
    
    let licenceNumberLabel : UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Lisans No :"
        lbl.textColor = UIColor.gray
        lbl.font = UIFont.systemFont(ofSize: 20, weight: 15)
        return lbl
    }()
    
    let licenceNumberTextField : UITextField = {
       let txt = UITextField()
        txt.backgroundColor = UIColor.white
        txt.font = UIFont.systemFont(ofSize: 18)
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    let passwordNumberLabel : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Lisans No :"
        lbl.textColor = UIColor.gray
        lbl.font = UIFont.systemFont(ofSize: 20, weight: 15)
        return lbl
    }()
    
    let passwordNumberTextField : UITextField = {
        let txt = UITextField()
        txt.backgroundColor = UIColor.white
        txt.font = UIFont.systemFont(ofSize: 18)
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAllComponentSettings()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) // herangi bir yere tiklandiginda keyboard kapanacak
    }
    
    override var prefersStatusBarHidden: Bool{
        return false // projeyi landscape yapip yana yatirdigimiz icin status bari gozukturmemiz gerekti
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent // arka plan beyaz oldugu icin status barin renklendirmesini beyazlastirmamis gerekti
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
        licenceNumberTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5).isActive = true
        licenceNumberTextField.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        licenceNumberTextField.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }


}

