//
//  API.swift
//  SlTest
//
//  Created by Mohamed Marouane YOUSSEF on 21/10/2017.
//  Copyright © 2017 Mohamed Marouane YOUSSEF. All rights reserved.
//

import Foundation
typealias APIRequestResponse = (Data?, URLResponse?, Error?) -> ()
struct API {
    
    static func loadData(fromUrl url:String? , response : @escaping APIRequestResponse) {
        
        guard let url  = url ,  let requestURL = URL(string: url) else {
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
    
    private struct Constants {
        static let APPID = ""
        static let baseURL = ""
    }
    
    enum ResourcePath: String {
        case service = ""
        
        var path: String {
            return Constants.baseURL + rawValue
        }
        
        var forecastpath: String {
            return Constants.baseURL + rawValue + Constants.APPID
        }
    }
    
    static func generateCurrentRequestURL() -> URL? {
        guard var components = URLComponents(string:"") else {
            return nil
        }
        
        components.queryItems = [URLQueryItem(name:"lat", value:"")]
        return components.url
    }
}


