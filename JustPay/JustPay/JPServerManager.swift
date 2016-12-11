//
//  JPServerManager.swift
//  JustPay
//
//  Created by Abhishek Thapliyal on 12/5/16.
//  Copyright © 2016 InHeap. All rights reserved.
//

import UIKit

var baseURL : String = "www.justpay.com"
var registrationURL : String = "/auth/register"
var loginURL : String = "/auth/login"
var checkUserURL : String = "/auth/check"
var userInfoURL : String = "/user"
var userUpdateURL : String = "/user"
var userDeleteURL : String = "/user"
var logoutURL : String = "/auth/logout"
var paymentURL : String = "/pay"

class JPServerManager: NSObject {

    
//====================================================================================================================================
// JUSTPAY : USER REGISTRATION
//====================================================================================================================================
    
    func userRegistration(user:JPUser) -> Void {
        
        let urlString : String = String(format:"%@%@", baseURL, registrationURL)
        let request : NSMutableURLRequest = JPRequestManager.postServerRequest(urlString: urlString, paramString: "")
        JPResponseManager.responseWithRequest(request: request, requestTitle: "USER_REGISTRATION", completion: { (json, error) in
        
            // TODO
            let jsonDict : NSDictionary = json as! NSDictionary
        })
        
    }
    
//====================================================================================================================================
// JUSTPAY : USER LOGIN
//====================================================================================================================================

    func userlogin(jpUser:JPUser, completion : @escaping (_ json:Any, _ error:NSError?) -> Void) -> Void {
        
        let urlString : String = String(format:"%@%@", baseURL, loginURL)
        let request : NSMutableURLRequest = JPRequestManager.postServerRequest(urlString: urlString, paramString: "")
        JPResponseManager.responseWithRequest(request: request, requestTitle: "USER_LOGIN", completion: { (json, error) in
            
            // TODO
            let jsonDict : NSDictionary = json as! NSDictionary
            completion(json, error)
        })
    }

//====================================================================================================================================
// JUSTPAY : USER LOGOUT
//====================================================================================================================================
    
    func userlogout() -> Void {
        
        // LOGOUT FORM SERVER
        let urlString : String = String(format:"%@%@", baseURL, logoutURL)
        let request : NSMutableURLRequest = JPRequestManager.postServerRequest(urlString: urlString, paramString: "")
        JPResponseManager.responseWithRequest(request: request, requestTitle: "USER_LOGOUT", completion: { (json, error) in
    
            // TODO
            let jsonDict : NSDictionary = json as! NSDictionary
        })
        
        // CLEARING USER DEFAULTS
        let bundle = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: bundle)
        UserDefaults.standard.synchronize()
    }
}
