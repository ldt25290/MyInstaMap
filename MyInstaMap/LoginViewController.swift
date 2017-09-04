//
//  LoginViewController.swift
//  MyInstaMap
//
//  Created by DucTran on 8/31/17.
//  Copyright © 2017 User. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    let getAccessTokenAddress = Constants.AUTH_ENDPOINT + "?client_id=" + Constants.CLIENT_ID + "&response_type=token&redirect_uri=" + Constants.REDIRECT_URI + "&scope=public_content"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
    }
    
    func setupWebView() {
        self.webView.delegate = self
        self.webView.scrollView.bounces = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //login and get access token
        getAccessTokenFromWebView()
    }
    
    func getAccessTokenFromWebView() {
       loadWebViewWithAddressString(urlString: getAccessTokenAddress)
    }
    
    func loadWebViewWithAddressString(urlString: String!) {
        let url = NSURL (string: urlString)
        let requestObj = NSURLRequest(url: url! as URL)
        self.webView.loadRequest(requestObj as URLRequest)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.loadWebViewWithAddressString(urlString:"about:blank")
    }
}

extension LoginViewController: UIWebViewDelegate {
    public func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {

        if (request.url?.host == "localhost") {
            let accessToken = getAccessTokenParameter(url: (request.url?.absoluteString)!, param: "access_token")
            
            if (accessToken != nil) {
                print("access_token = \(accessToken!)")
                
                //transition to viewcontroller
                if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "InstaMapViewController") as? InstaMapViewController {
                    viewController.accessToken = accessToken
                    if let navigator = navigationController {
                        navigator.pushViewController(viewController, animated: true)
                    }
                }
            }
            return false;
        }
        return true;
    }
    
    public func webViewDidStartLoad(_ webView: UIWebView) {
//        print(webView)
    }
    
    public func webViewDidFinishLoad(_ webView: UIWebView) {
//        print(webView)
    }
    
    public func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        if (error.code == NSURLErrorNotConnectedToInternet) {
            self.showNetworkErrorAlertView()
        } else  if error.code == NSURLErrorTimedOut {
            self.showErrorAlertWithTitle(Constants.ERROR_MSG_KEY, message: "Request Time Out")
        }
        print(error)
    }
    
    func getAccessTokenParameter(url: String, param: String) -> String? {
        guard let url = URLComponents(string: url) else { return nil }
        //url = "http://localhost/#access_token=5957904020.7179d97.1a33c2282e05474f9e1c83b22f3a9f1d"
        //url.fragment = "access_token=5957904020.7179d97.1a33c2282e05474f9e1c83b22f3a9f1d"
        let fragmentArr = url.fragment?.components(separatedBy: "=")
        
        if (fragmentArr?[0] == param) {
            return fragmentArr?[1]
        }
        
        return nil
    }

}
