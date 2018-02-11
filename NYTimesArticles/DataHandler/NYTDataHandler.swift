//
//  NYTDataHandler.swift
//  NYTimesArticles
//
//  Created by Suneelahammad Shaik on 10/02/18.
//  Copyright © 2018 Suneelahammad Shaik. All rights reserved.
//
import UIKit
import SwiftyJSON

class NYTDataHandler: NSObject {
    //Shared instance
     static let shared = NYTDataHandler()
    
    //Used to create model object from the received response
    func getPopularArticalDetails(with urlString: String, completion: @escaping ([NYTArticleModel], Error?) -> ()) {
        NYTServiceManager.shared.executeGetRequest(with: urlString) { (results:[[String:Any]], error:Error?) in
            guard error == nil else {
                completion([], error)
                return
            }
                var articalModelList = [NYTArticleModel]()
                for articleObj in results {
                    let paramsJSON = JSON(articleObj)
                    let paramsString = paramsJSON.rawString(String.Encoding.utf8, options: JSONSerialization.WritingOptions.prettyPrinted)!
                    //Add
                    let article = NYTArticleModel(JSONString: paramsString)
                    articalModelList.append(article!)
                }
                //  Passing parsed JSON data from closure to the calling method.
                completion(articalModelList, nil)
        }
    }
}
