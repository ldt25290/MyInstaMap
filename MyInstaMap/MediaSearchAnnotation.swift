//
//  MediaSearchAnnotation.swift
//  MyInstaMap
//
//  Created by DucTran on 9/1/17.
//  Copyright © 2017 User. All rights reserved.
//

import MapKit

@objc class MediaSearchAnnotation: NSObject {
    var mediaId: String?
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    var photoUrl: String?
    var avatarUrl: String?
    var postTime: String?
    var location: String?
    
    init(mediaId: String?, title: String?, subtitle: String?, coordinate: CLLocationCoordinate2D, photoUrl:String?, avatarUrl: String?, postTime: String?, location: String?) {
        self.mediaId = mediaId
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
        self.photoUrl = photoUrl
        self.avatarUrl = avatarUrl
        self.postTime = postTime
        self.location = location
    }
    
    static func getPlaces(media:MediaSearchModel) -> [MediaSearchAnnotation] {
        guard let array = media.data else { return [] }
        
        var places = [MediaSearchAnnotation]()
        
        for item in array {
            
            let mediaId = item.mediaDataId
            let title = item.user?.username
            let subtitle = item.caption?.text
            let latitude = item.location?.latitude ?? 0, longitude = item.location?.longitude ?? 0
            let photoUrl = item.images?.standard_resolution?.url
            let avatarUrl = item.user?.profile_picture
            let postTime = item.created_time
            let location = item.location?.name
            
            let place = MediaSearchAnnotation(mediaId:mediaId, title: title, subtitle: subtitle, coordinate: CLLocationCoordinate2DMake(latitude, longitude), photoUrl: photoUrl, avatarUrl: avatarUrl, postTime: postTime, location: location)
            places.append(place)
        }
        
        return places as [MediaSearchAnnotation]
    }
}

extension MediaSearchAnnotation: MKAnnotation { }
