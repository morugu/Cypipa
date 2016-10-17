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
    
    public func getPublicIP() -> String {
        print("getPublicIP")
        return ""
    }
   
    public static func getPublicIP(callback:(_ publicIP: String) -> Void) {
        callback("getPublicIP: async")
        
        let url = URL(string: Cypipa.CheckIPAddressURL)
        let urlRequest = URLRequest(url: url!)
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            guard error == nil else {
                print("error calling GET on /todos/1")
                return
            }
            
            var json = parseJSON(inputData: data!)
            print(json["origin"]!)
            
            if json["origin"] != nil {

            }
        }
        task.resume()
    }
    
    public func check(callback:() -> Void) {
        print("check: async")
        callback()
    }
    
    /**  */
    public func check() -> Bool {
        print("check")
        return false
    }
    
    static func parseJSON(inputData: Data) -> [String:String] {
        let json = try! JSONSerialization.jsonObject(with: inputData, options: JSONSerialization.ReadingOptions.mutableContainers)

        return json as! Dictionary
    }
}
