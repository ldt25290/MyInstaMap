//
//  AuthenticateAPI.swift
//  MyInstaMap
//
//  Created by DucTran on 9/3/17.
//  Copyright © 2017 User. All rights reserved.
//

import UIKit
import Alamofire

class AuthenticateAPI: NSObject {
    
    static let shared = AuthenticateAPI()
    
    private override init() {
         
    }
    
    func doLogoutInstagram(completeHanlder: @escaping ([String:String]?) -> ()) {
        
        guard Connectivity.isConnectedToInternet() else {
            completeHanlder([Constants.ERROR_MSG_KEY: Constants.APP_NETWORK_ERROR_MESSAGE])
            return
        }
        
        Alamofire.request(Constants.LOGOUT_ADDRESS).validate().responseData { (response) in
            switch response.result {
                
            case .success:
                completeHanlder(nil)
            case .failure(let error):
                print(error)
                completeHanlder([Constants.ERROR_MSG_KEY: error.localizedDescription])
            }
            
        }
        
    }
}
