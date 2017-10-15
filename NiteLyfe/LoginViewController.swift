//
//  LoginViewController.swift
//  NiteLyfe
//
//  Created by Jonah Zukosky on 10/13/17.
//  Copyright © 2017 Jonah Zukosky. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    
    let loginButton: FBSDKLoginButton = {
        let button = FBSDKLoginButton()
        button.readPermissions = ["email"]
        return button
    }()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        view.addSubview(loginButton)
        loginButton.center = view.center
        loginButton.delegate = self
        
        if let token = FBSDKAccessToken.current(){
        //    fetchProfile()
         //   self.performSegue(withIdentifier: "initUserSegue", sender: nil)
        }
    }
    
    
    
    
   /* func fetchProfile()
    {
        print("fetch profile")
        let parameters = ["fields": "email, first_name, last_name, picture.type(large)"]
        FBSDKGraphRequest(graphPath: "me", parameters: parameters).start(completionHandler: { (connection, result, error) -> Void in
            
            if error != nil {
                print(error)
                return
            }
            
            if let email = result?["email"] as? String {
                print(email)
                
            }
            if let picture = result!["picture"] as? NSDictionary, let data = picture["data"] as? NSDictionary, let url = data["url"] as? String{
                print(url)
            }
            
        }
    }*/
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        print("complete login")
        
        self.performSegue(withIdentifier: "initUserSegue", sender: nil)
       // fetchProfile()
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        //print("logged out")
    }
    func loginButtonWillLogin(_ loginButton: FBSDKLoginButton!) -> Bool {
        
        return true
    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}
