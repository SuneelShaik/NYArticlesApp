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
}
