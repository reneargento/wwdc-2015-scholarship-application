//
//  SkillsViewController.swift
//  ReneArgento
//
//  Created by Rene Argento on 4/23/15.
//  Copyright (c) 2015 wwdc. All rights reserved.
//

import UIKit

class SkillsViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    
    let cellName = "CollectionViewCell1"
    var skillsCollectionImages = [UIImage]()
    var skillsCollectionTexts = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initSkillsCollectionContent();
        self.title = "Skills"
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return skillsCollectionTexts.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: CollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(cellName, forIndexPath: indexPath) as! CollectionViewCell
        
        cell.imageView!.image = skillsCollectionImages[indexPath.row]
        cell.textLabel!.text = skillsCollectionTexts[indexPath.row]
        return cell
    }
    
    func initSkillsCollectionContent() {
        //Mobile
        skillsCollectionImages.append(UIImage(named: "mobile")!)
        skillsCollectionTexts.append("3 years")
        
        //Swift
        skillsCollectionImages.append(UIImage(named: "swift")!)
        skillsCollectionTexts.append("1 month")
        
        //Objective-C
        skillsCollectionImages.append(UIImage(named: "objective-c")!)
        skillsCollectionTexts.append("3 months")
        
        //Android
        skillsCollectionImages.append(UIImage(named: "android")!)
        skillsCollectionTexts.append("2 years")
        
        //Java
        skillsCollectionImages.append(UIImage(named: "java")!)
        skillsCollectionTexts.append("3 years")
        
        //C++
        skillsCollectionImages.append(UIImage(named: "c++")!)
        skillsCollectionTexts.append("1 year")
        
        //Github
        skillsCollectionImages.append(UIImage(named: "github")!)
        skillsCollectionTexts.append("3 years")
        
        //Databases
        skillsCollectionImages.append(UIImage(named: "database")!)
        skillsCollectionTexts.append("2 years")
        
        //SQL
        skillsCollectionImages.append(UIImage(named: "sql")!)
        skillsCollectionTexts.append("3 years")
    }

}
