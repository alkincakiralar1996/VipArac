//
//  ViewController.swift
//  VIP-Tematik
//
//  Created by Macintosh HD on 02/08/2017.
//  Copyright © 2017 Macintosh HD. All rights reserved.
//

import UIKit
import EFInternetIndicator

class LoginViewController: UIViewController,UITextFieldDelegate,InternetStatusIndicable,URLSessionDownloadDelegate {
    
    let userModel : User = User()
    let userFuncs : UserFuncs = UserFuncs()
    var internetConnectionIndicator:InternetViewIndicator?
    var urlLink: URL!
    var defaultSession: URLSession!
    var downloadTask: URLSessionDownloadTask!
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAllComponentSettings()
        startSettings()
        let backgroundSessionConfiguration = URLSessionConfiguration.background(withIdentifier: "backgroundSession")
        defaultSession = Foundation.URLSession(configuration: backgroundSessionConfiguration, delegate: self, delegateQueue: OperationQueue.main)
    }
    
    func startDownloading () {
        let url = URL(string: "http://tematik.net/VIP/alitest.gui.zip")!
        downloadTask = defaultSession.downloadTask(with: url)
        downloadTask.resume()
    }
    
    // MARK:- URLSessionDownloadDelegate
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print("File download succesfully")
        
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let documentDirectoryPath:String = path[0]
        let fileManager = FileManager()
        let destinationURLForFile = URL(fileURLWithPath: documentDirectoryPath.appendingFormat("/deneme.gui.zip"))
        
        if fileManager.fileExists(atPath: destinationURLForFile.path){
            do{
                try fileManager.removeItem(atPath: destinationURLForFile.path)
                try fileManager.moveItem(at: location, to: destinationURLForFile)
            }catch{
                print("error")
            }
        }
        else{
            do {
                try fileManager.moveItem(at: location, to: destinationURLForFile)
            }catch{
                print("An error occurred while moving file to destination url")
            }
        }
    }
    
    /*
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        downloadTask = nil
        if (error != nil) {
            print("didCompleteWithError \(error?.localizedDescription ?? "no value")")
        }
        else {
            print("The task finished successfully")
        }
    }*/
    
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

