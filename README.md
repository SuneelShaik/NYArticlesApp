# NYTArticlesApp

An iOS app displays the New York Times Most Popular Articles.  This app is a very simple app that basically does these 2 things:
1. Allows you to see the most popular articles for Today, past week and one month.
2. Allows you to see the details of each article when the itemson the list are tapped


Design Pattern
==============
Model View Controller (MVC)

Packages
========
NYTArticleHomeViewController.swift : This class will shows the list popular articles.

NYTArticleDetailsViewController.swift : This class will shows each article in details.

NYTArticleModel.swift : This is an model object which holds the Article details like title, section, published date. etc.

NYTMediaModel.swift : This is an model object which holds the Article media details like image url , height ,width. etc.

NYTServiceManager.swift : This class is responsible for making server communications.

NYTDataHandler.swift : This class is responsible for parsing received response and making model object.

Requirements
=============

XCode 9.2 or later

iOS 11.2 SDK or later

MacOS 10.23 or later

Swift 4.0

pod files:
```
pod 'ObjectMapper', '~> 3.0'
pod 'SwiftyJSON'
pod 'SDWebImage', '~> 4.0'
```

NY Times Most Popular Articles API Key. You can get a free API key here
https://developer.nytimes.com/signup

