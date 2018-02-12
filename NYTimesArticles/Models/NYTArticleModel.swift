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
        section          <- map[NYTConstants.ModelClassStrings.section]
        byLine           <- map[NYTConstants.ModelClassStrings.byLine]
        type             <- map[NYTConstants.ModelClassStrings.type]
        title            <- map[NYTConstants.ModelClassStrings.title]
        abstract         <- map[NYTConstants.ModelClassStrings.abstract]
        publishDate      <- map[NYTConstants.ModelClassStrings.publishedDate]
        source           <- map[NYTConstants.ModelClassStrings.source]
        media            <- map[NYTConstants.ModelClassStrings.media]
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
        type             <- map[NYTConstants.ModelClassStrings.type]
        subType          <- map[NYTConstants.ModelClassStrings.subType]
        mediaModel       <- map[NYTConstants.ModelClassStrings.mediaMetaData]
    }
}
