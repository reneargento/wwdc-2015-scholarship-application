//
//  MainViewController.swift
//  ReneArgento
//
//  Created by Rene Argento on 4/22/15.
//  Copyright (c) 2015 wwdc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var curriculumTableView: UITableView!
    @IBOutlet weak var progressSlider: UISlider!
    @IBOutlet weak var progressLabel: UILabel!
    
    let cellName = "cell"
    var tableViewCells: [String]!
    
    // Rows
    let workRowIndex = 0
    let studyRowIndex = 1
    let skillsRowIndex = 2
    let linkedInRowIndex = 3
    let githubRowIndex = 4
    
    let rowSize: CGFloat = 90.0
    
    let detailsSegue = "detailsSegue"
    let skillsSegue = "skillsSegue"
    let webViewSegue = "webViewSegue"
    var nextSection: Int?
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        tableViewCells = self.initTableViewCells()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        tableViewCells = self.initTableViewCells()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Curriculum Vitae"
        self.automaticallyAdjustsScrollViewInsets = false // make view controllers start below the status
    }
    
    override func viewWillAppear(animated: Bool) {
        self.updateSliderValue()
        
        removeThumbFromSlider()
    }
    
    override func viewDidAppear(animated: Bool) {
        self.checkUnlockedContent()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // UITableViewDelegate methods
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewCells.count
    }
    
    func tableView(tableView:UITableView, cellForRowAtIndexPath indexPath:NSIndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(cellName, forIndexPath: indexPath) as! UITableViewCell
        tableView.rowHeight = rowSize
        tableView.tableFooterView = UIView(frame: CGRectZero)
        
        cell.textLabel?.text = tableViewCells[indexPath.row]
        
        switch (indexPath.row) {
        case workRowIndex:
            cell.imageView!.image = UIImage(named: "laptop")
        case studyRowIndex:
            cell.imageView!.image = UIImage(named: "student")
        case skillsRowIndex:
            cell.imageView!.image = UIImage(named: "skills")
        case linkedInRowIndex:
            cell.imageView!.image = UIImage(named: "linkedIn")
        case githubRowIndex:
            cell.imageView!.image = UIImage(named: "github")
        default:
            break
        }
        
        
        return cell;
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        switch (indexPath.row) {
        case workRowIndex:
            nextSection = workRowIndex
            Util.accessedKey(Util.workKey)
            self.performSegueWithIdentifier(detailsSegue, sender: self)
        case studyRowIndex:
            nextSection = studyRowIndex
            Util.accessedKey(Util.educationKey)
            self.performSegueWithIdentifier(detailsSegue, sender: self)
        case skillsRowIndex:
            Util.accessedKey(Util.skillsKey)
            self.performSegueWithIdentifier(skillsSegue, sender: self)
        case linkedInRowIndex:
            nextSection = linkedInRowIndex
            Util.accessedKey(Util.linkedInKey)
            self.performSegueWithIdentifier(webViewSegue, sender: self)
        case githubRowIndex:
            nextSection = githubRowIndex
            self.performSegueWithIdentifier(webViewSegue, sender: self)
        default:
            break
        }
    }
    
    func initTableViewCells() -> [String] {
        var tableViewCells: [String]
        
        tableViewCells = ["Work", "Education", "Skills", "LinkedIn"]
        
        if Util.checkUnlockedContent() != Util.lockedValue {
            tableViewCells.append("Github")
        }
        
        return tableViewCells
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == detailsSegue {
            let viewController:DetailsViewController = segue.destinationViewController as! DetailsViewController
            viewController.section = nextSection
        } else if segue.identifier == webViewSegue {
            let webViewController:WebViewController = segue.destinationViewController as! WebViewController
            if nextSection == linkedInRowIndex {
                webViewController.destinationUrl = webViewController.linkedInUrl
            } else if nextSection == githubRowIndex {
                webViewController.destinationUrl = webViewController.githubUrl
            }
        }
    }
    
    func updateSliderValue(){
        let currentProgress = Util.getProgressValue()
        
        progressSlider.value = 25 * Float(currentProgress)
        progressLabel.text = "\(Int(progressSlider.value))" + "%"
    }
    
    func checkUnlockedContent() {
        if Util.checkUnlockedContent() == Util.unlockedButNotShownToUserValue {
            let alertTitle = "Congratulations"
            let alertMessage = "You accessed all sections and unlocked the extra section!"
            
            let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .Alert)
            
            let okAction = UIAlertAction(title: "Ok!", style: .Default) { (action: UIAlertAction!) -> Void in
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.tableViewCells = self.initTableViewCells()
                    self.curriculumTableView.reloadData()
                })
            }
            
            alert.addAction(okAction);
            
            presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    func removeThumbFromSlider() {
        var rect = CGRectMake(0,0,1,1)
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(1,1), false, 0)
        UIColor.clearColor().setFill()
        UIRectFill(rect)
        
        var blankImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        progressSlider.setThumbImage(blankImage, forState: .Normal)
    }
    
}

