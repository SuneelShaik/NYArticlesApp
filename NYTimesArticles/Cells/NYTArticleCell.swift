//
//  NYTArticleCell.swift
//  NYTimesArticles
//
//  Created by Suneelahammad Shaik on 10/02/18.
//  Copyright © 2018 Suneelahammad Shaik. All rights reserved.
//
import UIKit

class NYTArticleCell: UITableViewCell {

    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleByLine: UILabel!
    @IBOutlet weak var articleSection: UILabel!
    @IBOutlet weak var articlePublishedDate: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //Make rounded corner image
        articleImageView.layer.cornerRadius = articleImageView.frame.size.width / 2;
        articleImageView.clipsToBounds = true;
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    //MARK: - 
    //MARK: - Setup configuration
    //Populate the article cell fields with the real data
    func configureArticleCell(articleModel : NYTArticleModel) {
        //Check nil and assign the title data
        if let title = articleModel.title {
            articleTitle.text = title
        }
        //Check nil and assign the author data
        if let byLine = articleModel.byLine {
            articleByLine.text = byLine
        }
        //Check nil and assign the source data
        if let section = articleModel.section {
            articleSection.text = section
        }
        //Set article thumbnail picture
        let mediaModel = articleModel.media?.first
        if let thumbnailImageString = mediaModel?.mediaModel?[0].url {
            articleImageView.sd_setImage(with: URL(string: thumbnailImageString), placeholderImage: UIImage(named: NYTConstants.ImageProperties.noImage))
        }
        //Check nil and assign the publoished date data
        if let publishedDate = articleModel.publishDate {
            // Initialize with a string and separately declared attribute(s)
            let attributesStringColor = [ NSAttributedStringKey.foregroundColor: NYTConstants.ColorProperties.appColor]
            let dateAttributesString = NSMutableAttributedString(string: publishedDate, attributes: attributesStringColor)
            articlePublishedDate.setAttributedTitle(dateAttributesString, for: .normal)
            articlePublishedDate.setNeedsLayout()
        }
    }
}
