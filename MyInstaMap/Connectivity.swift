//
//  Connectivity.swift
//  MyInstaMap
//
//  Created by DucTran on 9/3/17.
//  Copyright © 2017 User. All rights reserved.
//

import Foundation
import Alamofire

class Connectivity: NSObject {
    
    static func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
    
}
