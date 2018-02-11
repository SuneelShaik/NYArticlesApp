//
//  NYTArticleHomeViewController.swift
//  NYTimesArticles
//
//  Created by Suneelahammad Shaik on 10/02/18.
//  Copyright © 2018 Suneelahammad Shaik. All rights reserved.
//
import UIKit

//To decide the selected period
enum ButtonType:Int {
    case day = 1
    case week = 7
    case month = 30
}

class NYTArticleHomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var dayButton: UIButton!
    @IBOutlet weak var weekButton: UIButton!
    @IBOutlet weak var monthButton: UIButton!
    
    var articalModelList:[NYTArticleModel] = []
    //period button tag values
    var buttonTags = [1,7,30]
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = NYTConstants.CellIdentifiers.articleCell
    
    
    // MARK: -
    // MARK: - View Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Set navigation title
        self.title = NYTConstants.NavigationConfigurations.homeScreenTitle
        //By default we will show one day period
        makeServiceCallForSelectedPeriod(periodType: "1")
        disableAllOtherButtons(tagValue: 1)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITableview
    // MARK: - UITableViewDataSource
    
    // number of sections in table view
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Check th ecount of the received article objects, if yes give the count otherwise set row count to zero
        return self.articalModelList.count > 0 ? self.articalModelList.count : 0
    }
    // MARK: - UITableViewDelegate
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell:NYTArticleCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! NYTArticleCell
        
        //Loop through each article model object
        let articalModel = self.articalModelList[indexPath.row]
        //Send article model to prepare cell for populating data
        cell.configureArticleCell(articleModel: articalModel)
        
        return cell
    }
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Loop throught to selected article data
        let articleModel = self.articalModelList[indexPath.row]
        //Navigate to NYTArticleDetailsViewController upon selection
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let articleDetailsViewController = storyBoard.instantiateViewController(withIdentifier: NYTConstants.StoryBoardIdentifier.detailsViewController) as! NYTArticleDetailsViewController
        articleDetailsViewController.articleModel = articleModel
        self.navigationController?.pushViewController(articleDetailsViewController, animated: true)
        
    }
    // MARK: -
    // MARK: - IBActions
    @IBAction func onClickButtonPeriodButton(_ sender: UIButton) {
        if let period = ButtonType(rawValue: sender.tag) {
            switch period {
            case .week:
                makeServiceCallForSelectedPeriod(periodType: "7")
                disableAllOtherButtons(tagValue: 7)
                break
            case .month:
                makeServiceCallForSelectedPeriod(periodType: "30")
                disableAllOtherButtons(tagValue: 30)
                break
            default:
                makeServiceCallForSelectedPeriod(periodType: "1")
                disableAllOtherButtons(tagValue: 1)
            }
        }
    }
    //change background color for selected and unselected button
    func disableAllOtherButtons(tagValue:Int) {
        for tag in buttonTags {
            let button = self.view.viewWithTag(tag) as! UIButton
            if tag == tagValue {
                button.backgroundColor = NYTConstants.ColorProperties.appColor
                button.setTitleColor(UIColor.white, for: .normal)
            } else {
                button.backgroundColor = UIColor.white
                button.setTitleColor(NYTConstants.ColorProperties.appColor, for: .normal)
            }
        }
    }
    
    // MARK: -
    // MARK: - Service communications
    //Make service call to get list of poprular articles
    func makeServiceCallForSelectedPeriod(periodType:String) {
        if Reachability.isConnectedToNetwork() == true {
            NYTActivityIndicator.sharedInstance.showActivityIndicator(uiView: (self.navigationController?.view)!)
            NYTDataHandler.shared.getPopularArticalDetails(with: periodType) { (articleModelData:[NYTArticleModel], error:Error?) in
                guard articleModelData.count > 0 else {
                    DispatchQueue.main.async {
                        // Updating UI on server failure
                        self.updateViewOnServerFailure()
                    }
                    return
                }
                self.articalModelList = articleModelData
                DispatchQueue.main.async {
                    //  Updating UI on main queue
                    NYTActivityIndicator.sharedInstance.hideActivityIndicator(uiView: (self.navigationController?.view)!)
                    self.tableView.reloadData()
                }
            }
        } else {
            // Updating UI on server failure
            self.updateViewOnServerFailure()
        }
    }
    
    // MARK: -
    // MARK: - Utility
    
    //To show show no data lable upon receivig nil reponse from server
    func showNoDataLabel() {
        //Refresh array upon receiving nil response from server
        self.articalModelList.removeAll()
        if (self.articalModelList.count > 0) {
            tableView.backgroundView = nil
            tableView.separatorStyle  = .singleLine
        } else {
            tableView.backgroundView  = NYTUtility.shared.createNoDataLabel(tableView: tableView)
            tableView.separatorStyle  = .none
        }
    }
    
    // Updating UI on server failure
    func updateViewOnServerFailure() {
        NYTActivityIndicator.sharedInstance.hideActivityIndicator(uiView: (self.navigationController?.view)!)
        self.showNoDataLabel()
        self.present(NYTUtility.shared.createAlertController(message: NYTConstants.WarningMessageAlert.noInternet), animated: true, completion: nil)
        self.tableView.reloadData()
    }
}
