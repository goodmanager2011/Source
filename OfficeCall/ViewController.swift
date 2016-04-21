//
//  ViewController.swift
//  OfficeCall
//
//  Created by Giang on 4/21/16.
//  Copyright © 2016 PHS. All rights reserved.
//

import UIKit
class ViewController: UIViewController {

    var officeCall: String?
    let api: ServiceAPI = ServiceAPI();

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
//        //get login
//        api.getLogin(success: { (response) in
//            print("response \(response)");
//        }) { (error) in
//            print("error \(error)");
//        }
//        //
        api.getPhone(success: { (response) in
            print("response \(response)")

//            if let valPhone = response["phone"] else{
//                print("error")
//            }

            self.officeCall = response["phone"] as? String
            
        }) { (error) in
            print("error \(error)");
        }
        
//        //post
//        api.postLocation(["location":"543"], success: { (response) in
//            print("response \(response)");
//        }) { (error) in
//            print("error \(error)");
//        }
        
    }

    @IBAction func postLocation(sender: AnyObject) {
        api.postLocation(["location":"543"], success: { (response) in
            print("response \(response)");
        }) { (error) in
            print("error \(error)");
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func fnGetCall(sender: AnyObject) {
        let phone = "tel://"+(officeCall)!
        
        let url: NSURL = NSURL(string:phone)!;
        UIApplication.sharedApplication().openURL(url);
    }
}

