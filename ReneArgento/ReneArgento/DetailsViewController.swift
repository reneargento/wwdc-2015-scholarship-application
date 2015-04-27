//
//  DetailsViewController.swift
//  ReneArgento
//
//  Created by Rene Argento on 4/22/15.
//  Copyright (c) 2015 wwdc. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var curriculumTableView: UITableView!
    
    let cellName = "cell"
    var tableViewCells: [String]!;
    
    let rowSize: CGFloat = 90.0;
    
    let workSection = 0
    let educationSection = 1
    var section: Int?;
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if section == educationSection {
            self.title = "Education"
        } else if section == workSection {
            self.title = "Work"
        }
        tableViewCells = self.initTableViewCells();
        
        self.automaticallyAdjustsScrollViewInsets = false // make view controllers start below the status
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // UITableViewDelegate methods
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewCells.count;
    }
    
    func tableView(tableView:UITableView, cellForRowAtIndexPath indexPath:NSIndexPath) -> UITableViewCell {
        
        var cell: TableViewCell = tableView.dequeueReusableCellWithIdentifier(cellName, forIndexPath: indexPath) as! TableViewCell
        tableView.rowHeight = rowSize
        tableView.tableFooterView = UIView(frame: CGRectZero)
        
        cell.contentLabel.text = tableViewCells[indexPath.row]
        
        switch (indexPath.row) {
        case 0:
            if section == educationSection {
                cell.imageView!.image = UIImage(named: "harvard")
                cell.yearLabel.text = "2014-2016"
            } else if section == workSection {
                cell.imageView!.image = UIImage(named: "movile")
                cell.yearLabel.text = "2015"
            }
        case 1:
            if section == educationSection {
                cell.imageView!.image = UIImage(named: "unicamp")
                cell.yearLabel.text = "2011-2014"
            } else if section == workSection {
                cell.imageView!.image = UIImage(named: "movile")
                cell.yearLabel.text = "2013-2014"
            }
        case 2:
            if section == educationSection {
                cell.imageView!.image = UIImage(named: "veris")
                cell.yearLabel.text = "2009-2012"
            } else if section == workSection {
                cell.imageView!.image = UIImage(named: "matera")
                cell.yearLabel.text = "2011-2012"
            }
        case 3:
            if section == educationSection {
                cell.imageView!.image = UIImage(named: "unicamp")
                cell.yearLabel.text = "2007-2010"
            } else if section == workSection {
                cell.imageView!.image = UIImage(named: "axoon")
                cell.yearLabel.text = "2010-2011"
            }
        default:
            break
        }
        
        return cell;
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
    }
    
    func initTableViewCells() -> [String] {
        var tableCellsContent: [String]
        
        if section == educationSection {
            tableCellsContent = ["Harvard University \nMaster of Liberal Arts in Management"
                , "University of Campinas \nMaster of Science in Technology"
                , "Veris Metrocamp\nBachelors of Science in Information Systems"
                , "University of Campinas \nBachelors of Science in Physical Education"]
        } else if section == workSection {
            tableCellsContent = ["Movile\nLead Mobile Developer"
                , "Movile\nMobile Developer"
                , "Matera Systems\nDatabase Management Intern"
                , "Axoon\nMobile Developer"]
        } else {
            tableCellsContent = []
        }
        
        return tableCellsContent
    }
    
}

