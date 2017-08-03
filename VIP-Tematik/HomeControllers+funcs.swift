//
//  HomeControllers+funcs.swift
//  VIP-Tematik
//
//  Created by Macintosh HD on 02/08/2017.
//  Copyright © 2017 Macintosh HD. All rights reserved.
//

import UIKit

extension HomeViewController{
    
    
    func handleCancel(){
        let loginPage = LoginViewController()
        self.present(loginPage, animated: true, completion: nil)
    }
    
}
