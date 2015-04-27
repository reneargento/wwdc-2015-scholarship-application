//
//  Util.swift
//  ReneArgento
//
//  Created by Rene Argento on 4/24/15.
//  Copyright (c) 2015 wwdc. All rights reserved.
//

import Foundation

class Util {
    
    static let progressKey = "progress"
    
    static let educationKey = "education"
    static let workKey = "work"
    static let skillsKey = "skills"
    static let linkedInKey = "linkedIn"
    
    static let unlockedContentKey = "unlockedContent"
    static let lockedValue = 0
    static let unlockedButNotShownToUserValue = 1
    static let unlockedAndShownToUserValue = 2
    static let totalSections = 4
    
    class func getProgressValue() -> Int{
        let userDefaults = NSUserDefaults.standardUserDefaults()
        var currentProgress = 0
        
        if let progress: AnyObject = userDefaults.valueForKey(progressKey) {
            currentProgress = progress as! Int
        }
        
        return currentProgress
    }
    
    class func updateProgressValue() {
        var currentProgress = getProgressValue()
        
        currentProgress++
        
        if currentProgress == totalSections {
            self.unlockContent()
        }
        
        var userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setValue(currentProgress, forKey: progressKey)
        userDefaults.synchronize()
    }
    
    class func accessedKey(key: String) {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        if userDefaults.valueForKey(key) == nil {
            userDefaults.setValue(1, forKey: key)
            userDefaults.synchronize()
            updateProgressValue()
        }
    }
    
    class private func unlockContent() {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setValue(unlockedButNotShownToUserValue, forKey: unlockedContentKey)
        userDefaults.synchronize()
    }
    
    class func checkUnlockedContent() -> Int{
        let userDefaults = NSUserDefaults.standardUserDefaults()
        var result = lockedValue
        
        if let unlockedContent: AnyObject = userDefaults.valueForKey(unlockedContentKey) {
            if unlockedContent as! Int == unlockedButNotShownToUserValue {
                userDefaults.setValue(unlockedAndShownToUserValue, forKey: unlockedContentKey)
                userDefaults.synchronize()
            }
            
            result = unlockedContent as! Int
        }
        
        return result
    }
    
}
