//
//  JPRequestManager.swift
//  JustPay
//
//  Created by Abhishek Thapliyal on 12/5/16.
//  Copyright © 2016 InHeap. All rights reserved.
//

import UIKit

class JPRequestManager: NSObject {

//====================================================================================================================================
// UNIVERSAL POST REQUEST METHOD
//====================================================================================================================================
    
    class func postServerRequest(urlString:String, paramString:String?) -> NSMutableURLRequest {
        
        var URLString : String = urlString
        if paramString != nil {
            URLString = String(format:"%@?%@", urlString, paramString!)
        }
        let requestURL = URL(string:URLString)!
        let request = NSMutableURLRequest(url:requestURL)
        request.httpMethod = "POST"
        request.timeoutInterval = 1000
        return request
    }
    
//====================================================================================================================================
// UNIVERSAL GET REQUEST METHOD
//====================================================================================================================================
    
    class func getServerRequest(urlString:String, paramString:String?) -> NSMutableURLRequest {
        
        var URLString : String = urlString
        if paramString != nil {
            URLString = String(format:"%@?%@", urlString, paramString!)
        }
        let requestURL = URL(string:URLString)!
        let request = NSMutableURLRequest(url:requestURL)
        request.httpMethod = "GET"
        request.timeoutInterval = 1000
        return request
    }
    
//====================================================================================================================================
// UNIVERSAL ADD HEADERS METHOD
//====================================================================================================================================
    
    func addHeadersParameters() -> Void {
        // IF REQUIRED
    }
    
}
