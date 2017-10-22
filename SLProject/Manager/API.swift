//
//  API.swift
//  SlTest
//
//  Created by Mohamed Marouane YOUSSEF on 21/10/2017.
//  Copyright © 2017 Mohamed Marouane YOUSSEF. All rights reserved.
//

import Foundation
let API_BASE_URL = ""
let API_KEY = ""

typealias APIRequestResponse = (Data?, URLResponse?, Error?) -> ()
struct API {
    
    static func loadData(fromUrl url:String? , response : @escaping APIRequestResponse) {
        
        guard let requestURL = API.generateCurrentRequestURL(param: "user") else {
            return
        }
        
        let urlRequest = URLRequest(url: requestURL)
        
        let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: response)
        task.resume()
    }
    
    static func login_now(username:String, password:String , url : String? , response: @escaping APIRequestResponse) {
        
        guard let url  = url ,  let requestURL = URL(string: url) else {
            return
        }
        let urlRequest = NSMutableURLRequest(url: requestURL)
        urlRequest.httpMethod = "POST"
        urlRequest.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
        
        let dict = ["username" : username,
                    "password" : password]
        
        var paramString = ""
        for (key,value) in dict {
            paramString += key + "=" + value + "&"
        }
        urlRequest.httpBody = paramString.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: urlRequest as URLRequest, completionHandler: response)
        task.resume()
        
        
    }
}

extension API {
    
    static func generateCurrentRequestURL(param : String) -> URL? {
        guard var components = URLComponents(string:API_BASE_URL) else {
            return nil
        }
        
        components.queryItems = [URLQueryItem(name:"Key", value:param),
                                 URLQueryItem(name:"key", value:API_KEY)]
        return components.url
    }
}


