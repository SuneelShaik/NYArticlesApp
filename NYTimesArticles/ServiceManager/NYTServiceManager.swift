//
//  NYTServiceManager.swift
//  NYTimesArticles
//
//  Created by Suneelahammad Shaik on 10/02/18.
//  Copyright © 2018 Suneelahammad Shaik. All rights reserved.
//
import UIKit

class NYTServiceManager: NSObject {
    //Shared instance
    static let shared = NYTServiceManager()
    
    // MARK: -
    // MARK: - GET service communication
    
    //Execute GET request and pass data from escaping closure
    func executeGetRequest(with urlString: String, completion: @escaping ([[String:Any]], Error?) -> ()) {
        let url = URL(string: NYTConstants.ServiceConfigurations.serviceBaseUrl + "\(urlString).json" + "?api-key=" + NYTConstants.ServiceConfigurations.serviceAPIKey)
        let urlRequest = URLRequest(url: url!)
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            //  send error message
            if error != nil {
                completion([], error)
            } else {
                //  Passing the data from closure to the calling method
                do {
                    //  JSON parsing
                    let responseDict = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any]
                    if let results = responseDict!["results"] as? [[String:Any]] {
                       completion(results,nil)
                    } else {
                        completion([], error)
                    }
                } catch {
                    completion([], error)
                }
            }
            }.resume()  // Starting the service call
    }
}
