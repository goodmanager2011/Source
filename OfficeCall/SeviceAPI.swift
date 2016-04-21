//
//  SeviceAPI.swift
//  OfficeCall
//
//  Created by Manh on 4/21/16.
//  Copyright © 2016 PHS. All rights reserved.
//

import Foundation
import Alamofire
class ServiceAPI: AnyObject {
    //get data login 
    /*
    {
    "message": "success"
    }
     */
    internal func getLogin(success succed: AnyObject ->(),failure fail : NSError -> ())
    {
        let get_login:String = "http://192.168.10.25:8080/api/login/manh"
        Alamofire.request(.GET, get_login).responseJSON{
            response in
            //handle JSON
            if response.result.value != nil
            {
                succed(response.result.value!);
            }
            else
            {
                fail(response.result.error!);
            }
        }
    }
    internal func getPhone(success succed: AnyObject ->(),failure fail : NSError -> ())
    {
        let get_login:String = "http://192.168.10.25:8080/api/getphone"
        Alamofire.request(.GET, get_login).responseJSON{
            response in
            //handle JSON
            if response.result.value != nil
            {
                succed(response.result.value!);
            }
            else
            {
                fail(response.result.error!);
            }
        }
    }
    internal func postLocation(param:[String: AnyObject],success succed: AnyObject ->(),failure fail : NSError -> ())
    {
        let post_location:String = "http://192.168.10.25:8080/api/postlocation";
        let headers = [
            "Content-Type": "application/x-www-form-urlencoded",
        ]
        
        Alamofire.request(.POST, post_location, parameters: param, encoding: .JSON,headers: headers).responseJSON{
            response in
            
            //handle JSON
            if response.result.value != nil
            {
                succed(response.result.value!);
            }
            else
            {
                fail(response.result.error!);
            }
        }
    }
}