//
//  SourceDetailsViewController.swift
//  RCApp
//
//  Created by Joao Chavez on 3/22/17.
//  Copyright © 2017 Fuzz. All rights reserved.
//

import UIKit

class SourceDetailsViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    //var page: Page?
    var urlReceived: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false
        webView.delegate = self
        
        let urlString = urlReceived
        let url = NSURL(string: urlString!)
        let request = NSURLRequest(url: url as! URL)
        webView.loadRequest(request as URLRequest)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    func webViewDidStartLoad( _ webView: UIWebView){
        myActivityIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad( _ webView: UIWebView){
        myActivityIndicator.stopAnimating()
        
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool{
        
        let url = request.url;
        url?.absoluteString
        return true
    }



}
