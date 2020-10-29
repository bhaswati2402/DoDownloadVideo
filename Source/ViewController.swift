//
//  ViewController.swift
//  DownloadVideo
//
//  Created by CodeBuzzers Technologies on 14/10/20.
//  Copyright © 2020 Bhaswati Sadhukhan. All rights reserved.
//

import UIKit
import Photos

let optionA = "co.notify.OptionA"
let optionB = "co.notify.optionB"

class ViewController: UIViewController {
    
    @IBOutlet var label : UILabel!
   
    private var one : String?
    let first = Notification.Name(rawValue: optionA)
    let second = Notification.Name(rawValue: optionB)
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("baseview: viewDidLoad")
        view.backgroundColor = UIColor.systemGray
        createObserver()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         print("baseview: viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
         super.viewDidAppear(animated)
         print("baseview: viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
         super.viewWillDisappear(animated)
         print("baseview: viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
         super.viewDidDisappear(animated)
         print("baseview: viewDidDisappear")
    }
    
    override func viewWillLayoutSubviews() {
         print("baseview: viewWillLayoutSubviews")
    }
    
    override func viewDidLayoutSubviews() {
         print("baseview: viewDidLayoutSubviews")
    }
    
    @IBAction func clickOnDownload(){
      
        
        
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let SecondVC = storyBoard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
     //   SecondVC.selectDelegate = self
        self.navigationController?.present(SecondVC, animated: true, completion: nil)
    }
    
    fileprivate func createObserver() {
        // option a
        NotificationCenter.default.addObserver(self, selector: #selector(changeOption), name: first, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(changeBackgroundColor), name: first, object: nil)
        
        // option b
        NotificationCenter.default.addObserver(self, selector: #selector(changeOption), name: second, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(changeBackgroundColor), name: second, object: nil)
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    @objc func changeOption(notification : Notification ){
        let isoptionA = notification.name == first
        let text = isoptionA ? "OPTION A" : "OPTION B"
        label.text = text
    }
    
    @objc func changeBackgroundColor(notification : Notification ){
        let isoptionA = notification.name == first
        let color = isoptionA ? UIColor.red : UIColor.blue
        view.backgroundColor = color
    }
    
}
extension ViewController : selectionProtocol {
    func didTapChnages(name: String, color: UIColor) {
        label.text = "Your option is \(name)"
        view.backgroundColor = color
    
    }
    
}

/**
 extension ViewController {
     //    downloadVideoLinkAndCreateAsset("http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4")
     
     //  saveVideos(videoLink: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4")
     func saveVideos(videoLink : String){
         
         guard let videoURL = URL(string: videoLink) else { return }
         
         URLSession.shared.downloadTask(with: videoURL) { (location , response, error) -> Void in
             
             let fileManager = FileManager.default
             
             let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0];
             
             print(documentsPath)
             
             guard let location = location else { return }
             
             let destination = NSURL(string: NSString(format: "%@/%@", documentsPath, videoURL.lastPathComponent) as String);
             
             print(destination as Any)
             
             try? fileManager.moveItem(atPath: location.path, toPath: destination!.path!)
             
             PHPhotoLibrary.requestAuthorization({ (a:PHAuthorizationStatus) -> Void in
                 PHPhotoLibrary.shared().performChanges({
                     PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: destination! as URL);
                 }) { completed, error in
                     if completed {
                         print("Video Saved in Photos")
                     } else {
                         print(error as Any)
                     }
                 }
             })
         }.resume()
     }
     func downloadVideoLinkAndCreateAsset(_ videoLink: String) {
         
         // use guard to make sure you have a valid url
         guard let videoURL = URL(string: videoLink) else { return }
         
         guard let documentsDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
         
         // check if the file already exist at the destination folder if you don't want to download it twice
         
         if !FileManager.default.fileExists(atPath: documentsDirectoryURL.appendingPathComponent(videoURL.lastPathComponent).path) {
             
             // set up your download task
             URLSession.shared.downloadTask(with: videoURL) { (location, response, error) -> Void in
                 
                 // use guard to unwrap your optional url
                 guard let location = location else { return }
                 
                 // create a deatination url with the server response suggested file name
                 let destinationURL = documentsDirectoryURL.appendingPathComponent(response?.suggestedFilename ?? videoURL.lastPathComponent)
                 
                 do {
                     
                     try FileManager.default.moveItem(at: location, to: destinationURL)
                     
                     PHPhotoLibrary.requestAuthorization({ (authorizationStatus: PHAuthorizationStatus) -> Void in
                         
                         // check if user authorized access photos for your app
                         if authorizationStatus == .authorized {
                             PHPhotoLibrary.shared().performChanges({
                                 PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: destinationURL)}) { completed, error in
                                     if completed {
                                         print("Video asset created")
                                     } else {
                                         print(error as Any)
                                     }
                             }
                         }
                     })
                     
                 } catch { print(error) }
                 
             }.resume()
             
         }
         else {
             print("File already exists at destination url")
         }
         
     }
     
 }

 
 */
