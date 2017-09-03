//
//  MediaSearchAnnotation.swift
//  MyInstaMap
//
//  Created by DucTran on 9/1/17.
//  Copyright © 2017 User. All rights reserved.
//

import MapKit

@objc class MediaSearchAnnotation: NSObject {
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    var photoUrl: String?
    
    init(title: String?, subtitle: String?, coordinate: CLLocationCoordinate2D, photoUrl:String?) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
        self.photoUrl = photoUrl
    }
    
    static func getPlaces(media:MediaSearchModel) -> [MediaSearchAnnotation] {
        guard let array = media.data else { return [] }
        
        var places = [MediaSearchAnnotation]()
        
        for item in array {
            
            let title = item.user?.full_name
            let subtitle = item.caption?.text
            let latitude = item.location?.latitude ?? 0, longitude = item.location?.longitude ?? 0
            let photoUrl = item.images?.thumbnail?.url
            
            let place = MediaSearchAnnotation(title: title, subtitle: subtitle, coordinate: CLLocationCoordinate2DMake(latitude, longitude), photoUrl: photoUrl)
            places.append(place)
        }
        
        return places as [MediaSearchAnnotation]
    }
}

extension MediaSearchAnnotation: MKAnnotation { }
