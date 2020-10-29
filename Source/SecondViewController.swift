//
//  SecondViewController.swift
//  DownloadVideo
//
//  Created by CodeBuzzers Technologies on 18/10/20.
//  Copyright © 2020 Bhaswati Sadhukhan. All rights reserved.
//

import UIKit


protocol selectionProtocol {
    func didTapChnages(name  : String , color : UIColor)
}

class SecondViewController:  UIViewController {

    var selectDelegate : selectionProtocol?
    
    fileprivate var gender :  String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SecondView: viewDidLoad")
        view.backgroundColor = UIColor.systemGray
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         print("SecondView: viewWillAppear")
    }
    override func viewDidAppear(_ animated: Bool) {
         super.viewDidAppear(animated)
         print("SecondView: viewDidAppear")
    }
    override func viewWillDisappear(_ animated: Bool) {
         super.viewWillDisappear(animated)
         print("SecondView: viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
         super.viewDidDisappear(animated)
         print("SecondView: viewDidDisappear")
    }
    
    override func viewWillLayoutSubviews() {
         print("SecondView: viewWillLayoutSubviews")
    }
    override func viewDidLayoutSubviews() {
         print("SecondView: viewDidLayoutSubviews")
    }
    
    @IBAction func clickOptionA(){
      
        // selectDelegate?.didTapChnages(name: "A", color: .systemTeal)
        
        let name = Notification.Name(rawValue: optionA)
        NotificationCenter.default.post(name: name, object: nil)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func clickOptionB(){
      // selectDelegate?.didTapChnages(name: "B", color: .systemIndigo)
       
        let name = Notification.Name(rawValue: optionB)
        NotificationCenter.default.post(name: name, object: nil)
        self.dismiss(animated: true, completion: nil)

    }
    
}



