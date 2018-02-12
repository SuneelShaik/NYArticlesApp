//
//  NYTConstants.swift
//  NYTimesArticles
//
//  Created by Suneelahammad Shaik on 10/02/18.
//  Copyright © 2018 Suneelahammad Shaik. All rights reserved.
//
import UIKit
struct NYTConstants {
    
    //App details
    struct AppDetails {
        static let AppName = "New York Times"
    }
    
    struct ServiceConfigurations {
        static let serviceBaseUrl = "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/"
        static let serviceAPIKey = "5aa997b8ed3a4482a69450dac3442f0f"
    }
    //Alert messages
    struct WarningMessageAlert {
        static let noInternet = "No Internet. Please make sure your device is connected to the Internet"
        static let OK = "OK"
        static let noDataFound = "No data found!"
    }
    //Storyboard identifiers
    struct StoryBoardIdentifier {
        static let detailsViewController = "NYTArticleDetailsViewController"
    }
    //TableviewCell identifiers
    struct CellIdentifiers {
        static let articleCell = "NYTArticleCell"
    }
    //Navigation Titles
    struct NavigationConfigurations {
        static let homeScreenTitle = "Articles"
        static let detailScreenTitle = "New York Times"
    }
    //Image properties
    struct ImageProperties {
        static let noImage = "noimagefound"
    }
    
    //Color properties
    struct ColorProperties {
        static let appColor = UIColor.init(red: 63.0/250.0, green: 66.0/250.0, blue: 83.0/250.0, alpha: 1)
    }
    //Color properties
    struct LabelStirngs {
        static let publishString = "Published date : "
    }
    //Model class properties
    struct ModelClassStrings {
        static let section = "section"
        static let byLine = "byline"
        static let type = "type"
        static let title = "title"
        static let abstract = "abstract"
        static let publishedDate = "published_date"
        static let source = "source"
        static let media = "media"
        static let subType = "subtype"
        static let mediaMetaData = "media-metadata"
        static let url = "url"
        static let format = "format"
        static let height = "height"
        static let width = "width"
    }
}
