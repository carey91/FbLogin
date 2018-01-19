//
//  ViewController.swift
//  FbLogin
//
//  Created by Carey Sam on 19/01/18.
//  Copyright © 2018 Carey Sam. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Add a custom login button to your app
        let myLoginButton = UIButton(type: .custom)
        myLoginButton.backgroundColor = UIColor.darkGray
        //myLoginButton.frame = CGRect(0, 0, 180, 40);
        myLoginButton.center = view.center
        myLoginButton.setTitle("Login with Facebook", for: .normal)
        
        // Handle clicks on the button
        myLoginButton.addTarget(self, action: #selector(self.loginButtonPressed) , for: .touchUpInside)
        
        // Add the button to the view
        view.addSubview(myLoginButton)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc func loginButtonPressed() {
        
        let loginManager = FBSDKLoginManager()
        loginManager.logIn(withReadPermissions: [ "public_profile" ,"email" ], from: self) { loginResult,error  in
            
            if error != nil {
                print("error")
            }else if(loginResult?.isCancelled)!{
                print("result cancelled")
            }else {
                print("success")
                
            }
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

