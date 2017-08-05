//
//  UserFuncs.swift
//  VIP-Tematik
//
//  Created by Macintosh HD on 04/08/2017.
//  Copyright © 2017 Macintosh HD. All rights reserved.
//

import UIKit
import AEXML

class UserFuncs{
    var globalFuncs = GlobalFuncs()
    func loginControl(user : User) -> Bool{
        
        let xmlDoc : AEXMLDocument = globalFuncs.xmlDataConnect()
        
        let root = xmlDoc.root["properties"]["devices"]["device"]
        
        guard let licenceNumber = root.attributes["name"], let password = root.value else{
            print("Veriler dosyadan cekilemedi")
            return false
        }
        
        if user.licenceNo == licenceNumber && user.password == password{
            return true
        }
        
        return false
    }
}
