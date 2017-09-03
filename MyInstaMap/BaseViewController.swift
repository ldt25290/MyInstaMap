//
//  BaseViewController.swift
//  MyInstaMap
//
//  Created by DucTran on 9/3/17.
//  Copyright © 2017 User. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(statusManager), name: .flagsChanged, object: Network.reachability)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func statusManager(_ notification: NSNotification) {
        updateUserInterface()
    }

    func updateUserInterface() {
        guard let status = Network.reachability?.status else { return }
        
        print("Reachability Summary")
        print("Status:", status)
        print("HostName:", Network.reachability?.hostname ?? "nil")
        print("Reachable:", Network.reachability?.isReachable ?? "nil")
        print("Wifi:", Network.reachability?.isReachableViaWiFi ?? "nil")
        
        switch status {
        case .unreachable:
            print("unreachable")
            self.showErrorAlertWithTitle("Error", message: Constants.APP_NETWORK_ERROR_MESSAGE)
        case .wifi:
            print("wifi")
        case .wwan:
            print("wwan")
        }

    }
    
}

extension UIViewController {
    func showErrorAlertWithTitle(_ title:String?, message:String) {
        
        let alertController = UIAlertController(title: title ?? "", message: message, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            
        }
        
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showSuccessAlertWithTitle(_ title:String?, message:String) {
        
        let alertController = UIAlertController(title: title ?? "", message: message, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            self.dismiss(animated: true, completion: {
                
            })
        }
        
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }

}
