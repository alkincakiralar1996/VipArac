//
//  HomeViewController.swift
//  VIP-Tematik
//
//  Created by Macintosh HD on 02/08/2017.
//  Copyright © 2017 Macintosh HD. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    let lbl : UILabel = {
        let lbl = UILabel()
        lbl.text = "HOME PAGE"
        lbl.font = UIFont.systemFont(ofSize: 20, weight: 20)
        lbl.backgroundColor = UIColor.red
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAllComponentSettings()
    }

    func setAllComponentSettings(){
        //view settings
        self.view.backgroundColor = UIColor.white
        
        // mid label settings
        self.view.addSubview(lbl)
        lbl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lbl.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        //nav bar settings
        navigationController?.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(handleCancel))
    }


}
