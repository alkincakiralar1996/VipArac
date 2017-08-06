//
//  Extensions.swift
//  VIP-Tematik
//
//  Created by Macintosh HD on 04/08/2017.
//  Copyright © 2017 Macintosh HD. All rights reserved.
//

import UIKit


extension UIColor{
    convenience init(r: CGFloat,g: CGFloat,b: CGFloat){
        self.init(red:r/255,green:g/255,blue:b/255,alpha:1)
    }
}

extension UIViewController{
    
    func valueControl(texts : [String],errorMessages : [String]) -> Bool{
        var count = 0
        for items in texts{
            if items.isEmpty{
                alert(message: errorMessages[count])
                return false
            }
            count += 1
        }
        return true
   }
    
    func alert(message : String){
        let alertController = UIAlertController(title: "VIP", message: message, preferredStyle: .alert)
        let alertButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(alertButton)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func passPage(page : UIViewController){
        present(page, animated: true, completion: nil)
    }
}
