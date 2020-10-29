//
//  ThirdViewController.swift
//  DownloadVideo
//
//  Created by CodeBuzzers Technologies on 19/10/20.
//  Copyright © 2020 Bhaswati Sadhukhan. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController  {

    @IBOutlet var txtView : UITextView!
    @IBOutlet var btn : TestButton!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
    
    
    @IBAction func clickOnButton() {
       
        btn.becomeFirstResponder()
        btn.textHand = { txt in
            self.txtView.text = txt
        }
       
   }
    
    
}



class TestButton: UIButton, UIKeyInput {

    var hasText: Bool = true
    
    var textHand : ((_ text : String) -> ())?
    
    var totalText : String = ""
    
    override var textInputContextIdentifier: String? { "EMOJI" } // return non-nil to show the Emoji keyboard ¯\_(ツ)_/¯

    func insertText(_ text: String)  {
        print("\(text)")
        totalText = totalText + text
        textHand?(totalText)
    }

    func deleteBackward() {}

    override var canBecomeFirstResponder: Bool { return true }

    override var canResignFirstResponder: Bool { return true }

    override var textInputMode: UITextInputMode? {
        for mode in UITextInputMode.activeInputModes {
            if mode.primaryLanguage == "emoji" {
                return mode
            }
        }
        return nil
    }
}
