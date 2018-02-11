//
//  NYTArticleModel.swift
//  NYTimesArticles
//
//  Created by Suneelahammad Shaik on 10/02/18.
//  Copyright © 2018 Suneelahammad Shaik. All rights reserved.
//
import UIKit
import ObjectMapper

// Model class for mapping artical objects
class NYTArticleModel: NSObject, Mappable {

    var section:String?
    var byLine:String?
    var type:String?
    var title:String?
    var abstract:String?
    var publishDate:String?
    var source:String?
    var media:[NYTMedia]?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        section          <- map["section"]
        byLine           <- map["byline"]
        type             <- map["type"]
        title            <- map["title"]
        abstract         <- map["abstract"]
        publishDate      <- map["published_date"]
        source          <- map["source"]
        media            <- map["media"]
    }
}

// Model class for mapping media objects
class NYTMedia: NSObject, Mappable {
    
    var type:String?
    var subType:String?
    var mediaModel: [NYTMediaModel]?
    
    required init?(map: Map) {
        
    }
    // Mappable
    func mapping(map: Map) {
        type             <- map["type"]
        subType          <- map["subtype"]
        mediaModel       <- map["media-metadata"]
    }
}
