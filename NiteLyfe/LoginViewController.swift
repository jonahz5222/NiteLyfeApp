//
//  LoginViewController.swift
//  NiteLyfe
//
//  Created by Jonah Zukosky on 10/13/17.
//  Copyright © 2017 Jonah Zukosky. All rights reserved.
//

import UIKit
import FacebookLogin
import FBSDKLoginKit

class LoginViewController: UIViewController {

    var dict : [String : AnyObject]!
    
    @IBAction func unwindToVC(segue: UIStoryboardSegue) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //creating button
        let loginButton = LoginButton(readPermissions: [ .publicProfile ])
        loginButton.center = view.center
        
        //adding it to view
        view.addSubview(loginButton)
        
        //if the user is already logged in
        if let accessToken = FBSDKAccessToken.current(){
            getFBUserData()
        }
        // Do any additional setup after loading the view.
    }
    //when login button clicked
    @objc func loginButtonClicked() {
        let loginManager = LoginManager()
        loginManager.logIn(readPermissions: [ .publicProfile ], viewController: self) { loginResult in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login.")
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                self.getFBUserData()
            }
        }
    }
    
    //function is fetching the user data
    func getFBUserData(){
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    self.dict = result as! [String : AnyObject]
                    print(result!)
                    print(self.dict)
                }
            })
        }
    }
}
    


   /* override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }*/
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

