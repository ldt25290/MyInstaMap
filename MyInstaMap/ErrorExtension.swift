//
//  ErrorExtension.swift
//  MyInstaMap
//
//  Created by DucTran on 9/4/17.
//  Copyright © 2017 User. All rights reserved.
//

import Foundation

extension Error {
    var code: Int { return (self as NSError).code }
    var domain: String { return (self as NSError).domain }
}
