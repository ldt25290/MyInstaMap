//
//  MediaAPI.swift
//  MyInstaMap
//
//  Created by DucTran on 9/3/17.
//  Copyright © 2017 User. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

final class MediaAPI: NSObject {
    
    static let shared = MediaAPI()
    
    private override init() {
        
    }
    
    func getMediaOnline(latitude:String, longtitude:String, accessToken:String, completeHanlder: @escaping ([String:Any]?) -> ()) {
        
        let mediaSearchAddress = Constants.API_URL + "/media/search?lat=\(latitude)&lng=\(longtitude)&access_token=\(accessToken)&distance=\(Constants.PARAM_DISTANCE)"
        
        Alamofire.request(mediaSearchAddress).validate().responseObject { (response:DataResponse<MediaSearchModel>) in
            
            switch response.result {
            case .success:
                if let mediaSearchModel = response.result.value  {
                    completeHanlder([Constants.RESPONSE_DATA_KEY: mediaSearchModel])
                }
            case .failure(let error):
                print(error)
                completeHanlder([Constants.ERROR_MSG_KEY: error.localizedDescription])
            }
        }

    }
}
