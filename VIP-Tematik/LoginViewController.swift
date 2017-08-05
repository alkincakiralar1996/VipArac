//
//  ViewController.swift
//  VIP-Tematik
//
//  Created by Macintosh HD on 02/08/2017.
//  Copyright © 2017 Macintosh HD. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,UITextFieldDelegate {
    
    let userModel : User = User()
    let userFuncs : UserFuncs = UserFuncs()
    
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
        txt.font = UIFont.systemFont(ofSize: 22)
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    let passwordNumberLabel : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Sifre :"
        lbl.textColor = UIColor.gray
        lbl.font = UIFont.systemFont(ofSize: 20, weight: 15)
        return lbl
    }()
    
    let passwordNumberTextField : UITextField = {
        let txt = UITextField()
        txt.backgroundColor = UIColor.white
        txt.font = UIFont.systemFont(ofSize: 22)
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.isSecureTextEntry = true
        return txt
    }()
    
    
    
    let licenceConfirmButton : UIButton = {
       let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Lisans No Onayla", for: .normal)
        btn.backgroundColor = UIColor.gray
        btn.tintColor = UIColor.black
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        btn.addTarget(self, action: #selector(handleLicenceConfirm), for: .touchUpInside)
        return btn
    }()
    
    let systemReadyButton : UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Sistemi Hazirla", for: .normal)
        btn.backgroundColor = UIColor.gray
        btn.tintColor = UIColor.black
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        btn.addTarget(self, action: #selector(handleSystemConfirm), for: .touchUpInside)
        return btn
    }()
    
    let spinner : UIActivityIndicatorView = {
       let spn = UIActivityIndicatorView()
        spn.translatesAutoresizingMaskIntoConstraints = false
        spn.isHidden = true
        spn.activityIndicatorViewStyle = .gray
        spn.transform = CGAffineTransform(scaleX: 2, y: 2)
        return spn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAllComponentSettings()
        startSettings()
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
    



}

