//
//  Cypipa.swift
//  Cypipa
//
//  Created by shoya on 10/17/16.
//  Copyright © 2016 Shoya Shiraki. All rights reserved.
//

import Foundation

public class Cypipa {
    
    static let CheckIPAddressURL: String = "https://httpbin.org/ip"
    
    /**  */
    public static func getPublicIP() -> URLSessionDataTask {
        let request = generateURLRequest()
        let session = generateURLSession()
        
        let task = session.dataTask(with: request)
        // TODO: develop sync request

        return task
    }
    
    /**  */
    public static func getPublicIP(callback:@escaping (_ publicIP: String) -> Void) {
        
        let request = generateURLRequest()
        let session = generateURLSession()
        let task = session.dataTask(with: request) {
            (data, response, error) in
            if error != nil {
                callback("")
                return
            }
            
            var json = parseJSON(inputData: data!)
            if json["origin"] != nil {
                let ipAddress = json["origin"]
                callback(ipAddress!)
            }
        }
        task.resume()
    }
    
    /**  */
    public static func check(checkTargetIPAdressList: [String], callback:@escaping (_ exsit: Bool) -> Void) {
        getPublicIP { (publicIP) in
            for IPAddress in checkTargetIPAdressList {
                if IPAddress == publicIP {
                    callback(true)
                    return
                }
            }
            callback(false)
        }
    }
    
    /**  */
    public static func check() -> Bool {
        print("check")
        return false
    }
    
    static func generateURLRequest() -> URLRequest {
        let url = URL(string: Cypipa.CheckIPAddressURL)
        let urlRequest = URLRequest(url: url!)
        return urlRequest
    }
    
    static func generateURLSession() -> URLSession {
        let sessionConfig = URLSessionConfiguration.default
        let urlSession = URLSession(configuration: sessionConfig)
        return urlSession
    }
    
    static func parseJSON(inputData: Data) -> [String:String] {
        let json = try! JSONSerialization.jsonObject(with: inputData, options: JSONSerialization.ReadingOptions.mutableContainers)
        return json as! Dictionary
    }
}
