//
//  LoginViewController.swift
//  ClubFinder
//
//  Created by Sunil Green on 3/31/19.
//  Copyright © 2019 Sunil Green. All rights reserved.
//

import UIKit
import GoogleSignIn
class LoginViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {
    
    
    
    @IBOutlet weak var btnGoogleSignIn:UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        btnGoogleSignIn.addTarget(self, action: #selector(signinUserUsingGoogle(_:)), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    
    
    @objc func signinUserUsingGoogle(_ sender: UIButton) {
    
        if btnGoogleSignIn.title(for: .normal) == "log out"{
            GIDSignIn.sharedInstance()?.signOut()
            btnGoogleSignIn.setTitle("Login", for: .normal)
        }else {
            GIDSignIn.sharedInstance()?.delegate = self
            GIDSignIn.sharedInstance()?.uiDelegate = self
            GIDSignIn.sharedInstance()?.signIn()
        }
       
    }

    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print("We have error signing up user == \(error.localizedDescription)")
        } else {
            if user != nil {
               
                print("Sign In successful")
                btnGoogleSignIn.setTitle("log out", for: .normal)
            }
        }
    }
}
