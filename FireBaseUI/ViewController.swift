//
//  ViewController.swift
//  FireBaseUI
//
//  Created by Fortune Infocomm Pvt Ltd on 29/01/18.
//  Copyright © 2018 Self. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuthUI
import FirebaseGoogleAuthUI
import FirebaseFacebookAuthUI
import FirebaseTwitterAuthUI
import FirebasePhoneAuthUI
import TwitterKit
import FBSDKLoginKit

class ViewController: UIViewController,AuthUIDelegate {
  
    fileprivate(set) var auth:Auth?
    fileprivate(set) var authUI: FUIAuth? //only set internally but get externally
    fileprivate(set) var authStateListenerHandle: AuthStateDidChangeListenerHandle?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.auth = Auth.auth()
        self.authUI = FUIAuth.defaultAuthUI()
        
        self.authUI?.providers = [FUIPhoneAuth(authUI: self.authUI!),FUIGoogleAuth(),
                                  FUIFacebookAuth(),
                                  FUITwitterAuth(),]
        
        
        self.authStateListenerHandle = self.auth?.addStateDidChangeListener { (auth, user) in
            
            
           
            guard user != nil else {
                self.loginAction(sender: self)
                return
            }
        }
    }
    
    
    func loginAction(sender:AnyObject){
   
            let authViewController = authUI?.authViewController();
            self.present(authViewController!, animated: true, completion: nil)
           print("NOT")
    }
    
    func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
        
      
        guard let authError = error else { return }
        
        let errorCode = UInt((authError as NSError).code)
        
        switch errorCode {
        case FUIAuthErrorCode.userCancelledSignIn.rawValue:
            print("User cancelled sign-in");
            break
            
        default:
            let detailedError = (authError as NSError).userInfo[NSUnderlyingErrorKey] ?? authError
            print("Login error: \((detailedError as! NSError).localizedDescription)");
        }
        
    }
    override func viewDidAppear(_ animated: Bool) {

        self.authStateListenerHandle = self.auth?.addStateDidChangeListener { (auth, user) in
 
            if Auth.auth().currentUser != nil {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "Main1")
                self.present(vc!, animated: true, completion: nil)
                
            }else{
                let authViewController = self.authUI?.authViewController();
                self.present(authViewController!, animated: true, completion: nil)
            }
            
    }
    
    

}

}

extension FUIAuthBaseViewController{
    override open func viewWillAppear(_ animated: Bool) {
        self.navigationItem.leftBarButtonItem = nil
    }
    
    
}














