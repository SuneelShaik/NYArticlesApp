//
//  NYTMediaModel.swift
//  NYTimesArticles
//
//  Created by Suneelahammad Shaik on 10/02/18.
//  Copyright © 2018 Suneelahammad Shaik. All rights reserved.
//
import UIKit
import ObjectMapper

// Model class for mapping media metadata item objects
class NYTMediaModel: NSObject, Mappable {
    var url:String?
    var format:String?
    var height:String?
    var width:String?
    
    required init?(map: Map) {
        
    }
    // Mappable
    func mapping(map: Map) {
        url          <- map[NYTConstants.ModelClassStrings.url]
        format       <- map[NYTConstants.ModelClassStrings.format]
        height       <- map[NYTConstants.ModelClassStrings.height]
        width        <- map[NYTConstants.ModelClassStrings.width]
    }
}
