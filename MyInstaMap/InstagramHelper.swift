//
//  InstagramHelper.swift
//  MyMapBook
//
//  Created by User on 8/30/17.
//  Copyright © 2017 User. All rights reserved.
//

import Foundation
import UIKit

class InstagramHelper: NSObject {
    var webView: UIWebView?
    
    func getAccessTokenFromWebView() {
        self.webView = UIWebView(frame: CGRect.init(origin: CGPoint.init(x: 0, y: 0) , size: CGSize.init(width: 200, height: 200)))
        
        guard let myWebView = self.webView else {
            return
        }
        
        myWebView.delegate = self
        let url = NSURL (string: "http://www.instagram.com/oauth/authorize/?client_id=7179d974f29d414d8f596b8d0cff796c&redirect_uri=http://localhost&response_type=token&scope=basic")
        let requestObj = NSURLRequest(url: url! as URL)
        myWebView.loadRequest(requestObj as URLRequest)
    }
    
    
    deinit {
        print("deinit InstagramHelper")
    }
}

extension InstagramHelper: UIWebViewDelegate {
    public func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        print("1.2. shouldStartLoadWith request ", request.url?.absoluteString ?? "")
        
        return true;
    }
    
    public func webViewDidStartLoad(_ webView: UIWebView) {
        print(webView)
    }

    public func webViewDidFinishLoad(_ webView: UIWebView) {
        print(webView)
    }
    
    public func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        print(error)
    }
    
    
}
