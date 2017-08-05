//
//  GlobalFuncs.swift
//  VIP-Tematik
//
//  Created by Macintosh HD on 05/08/2017.
//  Copyright © 2017 Macintosh HD. All rights reserved.
//

import UIKit
import AEXML

class GlobalFuncs{
    enum MyError: Error {
        case FoundNil(String)
    }
    
    func xmlDataConnect() -> AEXMLDocument{
        let xmlPath = Bundle.main.path(forResource: "VIP", ofType: "xml")
        
        do{
            let data = try? Data(contentsOf: URL(fileURLWithPath: xmlPath!))
            let xmlDoc = try? AEXMLDocument(xml: data!)
            return xmlDoc!
        }catch{
            print("DOSYAYLA BAGLANTI KURULAMADI")
        }
    }

}
