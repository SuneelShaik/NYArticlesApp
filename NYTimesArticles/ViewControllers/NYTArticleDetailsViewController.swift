//
//  NYTArticleDetailsViewController.swift
//  NYTimesArticles
//
//  Created by Suneelahammad Shaik on 10/02/18.
//  Copyright © 2018 Suneelahammad Shaik. All rights reserved.
//
import UIKit
import SDWebImage

class NYTArticleDetailsViewController: UIViewController {

    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var articleByLine: UILabel!
    @IBOutlet weak var articleDetailsTextView: UITextView!
    var articleModel:NYTArticleModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Set navigation title
        self.title = NYTConstants.NavigationConfigurations.detailScreenTitle
        configureArticleDetailsView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: -
    // MARK: - Configure Article detail view
    func configureArticleDetailsView() {
        //Set article title
        if let title = articleModel?.title {
            articleTitle.text = title
        }
        //Set article author name
        if let byLine = articleModel?.byLine, let publishedDate = articleModel?.publishDate {
            var publishedDetailsString = ""
            if byLine.count > 0 && publishedDate.count > 0 {
                 publishedDetailsString = byLine + "\n" + NYTConstants.LabelStirngs.publishString + publishedDate
            } else if byLine.count > 0  {
                 publishedDetailsString = byLine
            } else if publishedDate.count > 0  {
                publishedDetailsString = NYTConstants.LabelStirngs.publishString + publishedDate
            }
            articleByLine.text = publishedDetailsString
        }
        //Set article large picture
        let mediaModel = self.articleModel?.media?.first
        if let largeImageString = mediaModel?.mediaModel?[1].url {
            articleImageView.sd_setImage(with: URL(string: largeImageString), placeholderImage: UIImage(named: NYTConstants.ImageProperties.noImage))
        }
        //Set article title
        if let articalAbstract = articleModel?.abstract {
            articleDetailsTextView.text = articalAbstract
        }
    }
}
