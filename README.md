# NYTArticlesApp

An iOS app displays the New York Times Most Popular Articles.  This app is a very simple app that basically does these 2 things:
1. Allows you to see the most popular articles for Today, past week and one month.
2. Allows you to see the details of each article when the items on the list are tapped.


Design Pattern
==============
Model-view-controller(MVC)

Packages
========
NYTArticleHomeViewController.swift : This class will shows the list of popular articles.

NYTArticleDetailsViewController.swift : This class will shows each article in details.

NYTArticleModel.swift : This is an model object which holds the Article details like title, section, published date. etc.

NYTMediaModel.swift : This is an model object which holds the Article media details like image url , height ,width. etc.

NYTServiceManager.swift : This class is responsible for making server communications.

NYTDataHandler.swift : This class is responsible for parsing received response and making model objects.

Requirements
=============

XCode 9.2 or later

iOS 11.2 SDK or later

MacOS 10.12 or later

Swift 4.0

pods : pod files needs to be updated before using this project

Steps to update pod files if you have already pods installed 
```
1. Open Terminal
2. Change directory to NYTimesArticles.xcodeproj location
3. Type pod install
```
```
pod 'ObjectMapper', '~> 3.0'
pod 'SwiftyJSON'
pod 'SDWebImage', '~> 4.0'
```
Steps to install pods for first time
```
POD Install

[ 1 ] Open terminal and type:

sudo gem install cocoapods
Gem will get installed in Ruby inside System library. Or try on 10.11 Mac OSX El Capitan, type:

sudo gem install -n /usr/local/bin cocoapods
If there is an error "activesupport requires Ruby version >= 2.xx", then install latest activesupport first by typing in terminal.

sudo gem install activesupport -v 4.2.6
[ 2 ] After installation, there will be a lot of messages, read them and if no error found, it means cocoapods installation is done. Next, you need to setup the cocoapods master repo. Type in terminal:

pod setup

And wait it will download the master repo. The size is very big (370.0MB at Dec 2016). So it can be a while. You can track of the download by opening Activity and goto Network tab and search for git-remote-https. Alternatively you can try adding verbose to the command like so:

pod setup --verbose

[ 3 ] Once done it will output "Setup Complete", and you can create your XCode project and save it.

[ 4 ] Then in terminal cd to "your XCode project root directory" (where your .xcodeproj file resides) and type:

pod init

[ 5 ] Then open your project's podfile by typing in terminal:

open -a Xcode Podfile

[ 6 ] Your Podfile will get open in text mode. Initially there will be some default commands in there. Here is where you add your project's dependencies. in the podfile, type

pod 'ObjectMapper', '~> 3.0'
pod 'SwiftyJSON'
pod 'SDWebImage', '~> 4.0'

Other tips:

Uncomment  platform :ios, '8.0' Uncomment  user_frameworks! if you're using Swift

When you are done editing the podfile, save it and close XCode.

[ 7 ] Then install pods into your project by typing in terminal:

pod install

Depending how many libraries you added to your podfile for your project, the time to complete this varies. Once completed, there will be a message that says

"Pod installation complete! There are X dependencies from the Podfile and X total pods installed."
Thats it. Done
```

NY Times Most Popular Articles API Key. You can get a free API key here
https://developer.nytimes.com/signup

