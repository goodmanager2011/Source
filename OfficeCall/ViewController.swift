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
        api.getLogin { (response) in
            if response.result.value != nil
            {
                //success
                print("response \(response.result.value)")
                
            }
            else
            {
                //fail
                print("response \(response.result.error)")
                
            }
        }
        api.getPhone { (response) in
            if response.result.value != nil
            {
                //success
                print("response \(response.result.value)")
                self.officeCall = response.result.value!["phone"] as? String;
            }
            else
            {
                //fail
                print("response \(response.result.error)")

            }
        }
        
    }

    @IBAction func postLocation(sender: AnyObject) {
        api.postLocation(["location":"1235"]) { (response) in
            if response.result.value != nil
            {
                //success
                print("response \(response.result.value)")
                
            }
            else
            {
                //fail
                print("response \(response.result.error)")
                
            }
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

