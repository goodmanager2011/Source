//
//  SeviceAPI.swift
//  OfficeCall
//
//  Created by Manh on 4/21/16.
//  Copyright © 2016 PHS. All rights reserved.
//

import Foundation
import Alamofire
//GET
let get_login: String = "http://192.168.10.25:8080/api/login/manhas";
let get_phone: String = "http://192.168.10.25:8080/api/getphone";
//POST
let post_location: String = "http://192.168.10.25:8080/api/postlocation";

class ServiceAPI: AnyObject {
    
//    internal func getLogin(success succed: AnyObject ->(),failure fail : NSError -> ())
    internal func getLogin(complete completed: (Response<AnyObject, NSError>) ->())
    {
        Alamofire.request(.GET, get_login).responseJSON{
            response in
            //handle JSON
            completed(response);
        }
    }
    internal func getPhone(complete completed: (Response<AnyObject, NSError>) ->())
    {
        Alamofire.request(.GET, get_phone).responseJSON{
            response in
            //handle JSON
            completed(response);
        }
    }
    internal func postLocation(param:[String: AnyObject],complete completed: (Response<AnyObject, NSError>) ->())
    {
        Alamofire.request(.POST, post_location, parameters: param, encoding: .URL)
            .responseJSON { response in
                
                completed(response);
        }

    }
}