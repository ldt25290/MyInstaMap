//
//  MediaModel.swift
//  MyMapBook
//
//  Created by User on 8/30/17.
//  Copyright © 2017 User. All rights reserved.
//

import Foundation
import ObjectMapper

//struct User: Mappable {
//    var userId: String?
//    var full_name: String?
//    var profile_picture: String?
//    var username: String?
//    
//    init?(map: Map) {
//        
//    }
//    
//    // Mappable
//    mutating func mapping(map: Map) {
//        userId              <- map["id"]
//        full_name           <- map["full_name"]
//        profile_picture       <- map["profile_picture"]
//        username            <- map["username"]
//    }
//}
//
//struct ImageInfo: Mappable {
//    var width: Int?
//    var height: Int?
//    var url: String?
//    
//    init?(map: Map) {
//        
//    }
//    
//    // Mappable
//    mutating func mapping(map: Map) {
//        width               <- map["width"]
//        height              <- map["height"]
//        url                 <- map["url"]
//    }
//}
//
//struct ImageModel: Mappable {
//    var thumbnail: ImageInfo?
//    var low_resolution: ImageInfo?
//    var standard_resolution: ImageInfo?
//    
//    init?(map: Map) {
//        
//    }
//    
//    // Mappable
//    mutating func mapping(map: Map) {
//        thumbnail              <- map["thumbnail"]
//        low_resolution         <- map["low_resolution"]
//        standard_resolution    <- map["standard_resolution"]
//    }
//}
//
//struct Caption: Mappable {
//    var captionId: String?
//    var text: String?
//    var created_time: String?
//    var from: User?
//    
//    init?(map: Map) {
//        
//    }
//    
//    // Mappable
//    mutating func mapping(map: Map) {
//        captionId           <- map["id"]
//        text                <- map["text"]
//        created_time         <- map["created_time"]
//        from                <- map["from"]
//    }
//}
//
//struct Likes: Mappable {
//    var count: Int?
//    
//    init?(map: Map) {
//        
//    }
//    
//    // Mappable
//    mutating func mapping(map: Map) {
//        count              <- map["count"]
//    }
//}
//
//struct Comments: Mappable {
//    var count: Int?
//    
//    init?(map: Map) {
//        
//    }
//    
//    // Mappable
//    mutating func mapping(map: Map) {
//        count              <- map["count"]
//    }
//}
//
//struct Location: Mappable {
//    var latitude: Double?
//    var longitude: Double?
//    var name: String?
//    var locationId: Int?
//    
//    init?(map: Map) {
//        
//    }
//    
//    // Mappable
//    mutating func mapping(map: Map) {
//        latitude              <- map["latitude"]
//        longitude           <- map["longitude"]
//        name                <- map["name"]
//        locationId            <- map["id"]
//    }
//}
//
//struct VideoModel: Mappable {
//    var low_resolution: ImageInfo?
//    var low_bandwidth: ImageInfo?
//    var standard_resolution: ImageInfo?
//    
//    init?(map: Map) {
//        
//    }
//    
//    // Mappable
//    mutating func mapping(map: Map) {
//        low_resolution              <- map["low_resolution"]
//        low_bandwidth         <- map["low_bandwidth"]
//        standard_resolution    <- map["standard_resolution"]
//    }
//
//}
//
//struct Data: Mappable {
//    var mediaId: String?
//    var user: User?
//    var images: ImageModel?
//    var videos: VideoModel?
//    var created_time: String?
//    var caption: Caption?
//    var user_has_liked: Bool?
//    var likes: Likes?
//    var tags: [String]?
//    var filter: String?
//    var comments: Comments?
//    var type: String?
//    var link: String?
//    var location: Location?
//    var users_in_photo: [String]?
//    
//    init?(map: Map) {
//        
//    }
//    
//    // Mappable
//    mutating func mapping(map: Map) {
//        mediaId              <- map["id"]
//        user           <- map["user"]
//        images       <- map["images"]
//        videos           <- map["videos"]
//        created_time            <- map["created_time"]
//        caption              <- map["caption"]
//        user_has_liked           <- map["user_has_liked"]
//        likes       <- map["likes"]
//        tags            <- map["tags"]
//        filter              <- map["filter"]
//        comments           <- map["comments"]
//        type       <- map["type"]
//        link            <- map["link"]
//        location              <- map["location"]
//        users_in_photo      <- map["users_in_photo"]
//    }
//}
//
//struct Meta: Mappable {
//    var code: Int?
//    
//    init?(map: Map) {
//        
//    }
//    
//    // Mappable
//    mutating func mapping(map: Map) {
//        code              <- map["code"]
//    }
//}
//
//struct Pagination: Mappable {
//    var next_min_id: String?
//    var min_tag_id: String?
//    var deprecation_warning: String?
//    
//    init?(map: Map) {
//        
//    }
//    
//    // Mappable
//    mutating func mapping(map: Map) {
//        next_min_id              <- map["next_min_id"]
//        min_tag_id           <- map["min_tag_id"]
//        deprecation_warning       <- map["deprecation_warning"]
//    }
//}
//
//struct MediaModel: Mappable {
//    var pagination: Pagination?
//    var data: [Data]?
//    var meta: Meta?
//    
//    init?(map: Map) {
//        
//    }
//    
//    // Mappable
//    mutating func mapping(map: Map) {
//        pagination              <- map["pagination"]
//        data           <- map["data"]
//        meta       <- map["meta"]
//    }
//}
