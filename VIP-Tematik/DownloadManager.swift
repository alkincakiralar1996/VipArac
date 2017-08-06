import UIKit
import Zip
class Downloader : NSObject, URLSessionDownloadDelegate {
    
    var url : URL?
    var destinationUrl : URL?

    
    // INDIRME TAMAMLANDIKTAN SONRA GERCEKLESEN
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL)
    {
        //copy downloaded data to your documents directory with same names as source file
        let documentsUrl =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        destinationUrl = documentsUrl!.appendingPathComponent(url!.lastPathComponent)
        let dataFromURL = NSData(contentsOf: location)
        dataFromURL?.write(to: destinationUrl!, atomically: true)
        print(destinationUrl!.path)
        xmlOpen()
    }

    
    // EGER INDIRME SIRASINDA BIR HATA MEYDANA GELIRSE
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?)
    {
        if(error != nil) // ERRORUN ICI BOS DEGILSE YANI ERROR VARSA
        {
            print("Download completed with error: \(error!.localizedDescription)");
        }
    }
    
    // INDIRME ISLEMININ YAPILACAGI METHOD
    func download(url: URL)
    {
        self.url = url
        
        let sessionConfig = URLSessionConfiguration.background(withIdentifier: url.absoluteString)
        let session = Foundation.URLSession(configuration: sessionConfig, delegate: self, delegateQueue: nil)
        let task = session.downloadTask(with: url)
        task.resume()
    }
    
    //INDIRILEN XML DOSYASININ ACILACAGI METHOD
    func xmlOpen(){
        do{
            _ = try Zip.quickUnzipFile((destinationUrl?.absoluteURL)!, progress: { (progress) in
                print(progress)
            })
        }catch{
            print("error")
        }
    }
    
}

