//
//  WebViewController.swift
//  ReneArgento
//
//  Created by Rene Argento on 4/24/15.
//  Copyright (c) 2015 wwdc. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    
    var destinationUrl: String!
    let linkedInUrl = "https://www.linkedin.com/in/reneargento"
    let githubUrl = "https://github.com/reneargento"
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if destinationUrl == linkedInUrl {
            self.title = "LinkedIn"
        } else if destinationUrl == githubUrl {
            self.title = "Github"
        }
        
        let requestObject = NSURLRequest(URL:NSURL(string:destinationUrl)!)
        webView.loadRequest(requestObject)
    }
    
}
