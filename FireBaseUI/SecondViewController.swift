//
//  SecondViewController.swift
//  FireBaseUI
//
//  Created by Fortune Infocomm Pvt Ltd on 30/01/18.
//  Copyright © 2018 Self. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuthUI

class SecondViewController: UIViewController {
    fileprivate(set) var auth:Auth?
    fileprivate(set) var authUI: FUIAuth? //only set internally but get externally
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signout(_ sender: Any) {
         try! Auth.auth().signOut()
        UserDefaults.standard.set(false, forKey: "hasRunBefore")
        UserDefaults.standard.synchronize()
        

    }
    
    /*
    // MARK: - Navigationo

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
