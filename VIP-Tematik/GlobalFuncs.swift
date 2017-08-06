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
    
    var xml : AEXMLDocument!
    func xmlDataConnect(licenceNo : String) -> AEXMLDocument{
        let documentsUrl =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let xmlPath = "\(documentsUrl!.path)/\(licenceNo).gui/VIP.gui"
        do{
            let data = try Data(contentsOf: URL(fileURLWithPath: xmlPath))
            xml = try AEXMLDocument(xml: data)
        }
        catch{
            print("DOSYAYLA BAGLANTI KURULAMADI")
        }
        return xml
    }

}
