//
//  JPResponseManager.swift
//  JustPay
//
//  Created by Abhishek Thapliyal on 12/5/16.
//  Copyright © 2016 InHeap. All rights reserved.
//

import UIKit

enum RESPONSE_CODE : Int {
    
    case SUCCESS = 200
    case ERROR = 400
}

class JPResponseManager: NSObject {

    class func responseWithRequest(request:NSMutableURLRequest ,requestTitle:String ,  completion : @escaping (_ json:Any, _ error:NSError?) -> Void) {
     
        let task : URLSessionDataTask = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            
            let httpResponse = response as! HTTPURLResponse
            print("HTTP RESPONSE \(httpResponse.description) && CODE :: \(httpResponse.statusCode)")
            print("ERROR RESPONSE (IF-ANY) :: \(error?.localizedDescription)")
            
            var jsonResponse: Any? = nil
            
            if httpResponse.statusCode == RESPONSE_CODE.SUCCESS.rawValue {  // 200
            
                do {
                     jsonResponse = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as! [String:AnyObject]
                } catch let err as NSError {
                    print("RESPONSE_EXCEPTION :: \(err.localizedDescription)")
                }
                
            }
            else {
                // HANDLE ERROR HERE i.e. 400
            }
            completion(jsonResponse as Any, error as NSError?)
        }
        task.resume()
    }
}
