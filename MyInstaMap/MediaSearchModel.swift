//
//  MediaSearchModel.swift
//  MyInstaMap
//
//  Created by User on 8/30/17.
//  Copyright © 2017 User. All rights reserved.
//

import Foundation
import ObjectMapper

struct MediaData: Mappable {
    var mediaDataId: String?
    var user: User?
    var images: ImageModel?
    var created_time: String?
    var caption: Caption?
    var user_has_liked: Bool?
    var likes: Likes?
    var tags: [String]?
    var filter: String?
    var comments: Comments?
    var type: String?
    var link: String?
    var location: Location?
    var users_in_photo: [String]?

    init?(map: Map) {
        
    }
    
    // Mappable
    mutating func mapping(map: Map) {
        mediaDataId             <- map["id"]
        user                    <- map["user"]
        images                  <- map["images"]
        created_time            <- map["created_time"]
        caption                 <- map["caption"]
        user_has_liked          <- map["user_has_liked"]
        likes                   <- map["likes"]
        tags                    <- map["tags"]
        filter                  <- map["filter"]
        comments                <- map["comments"]
        type                    <- map["type"]
        link                    <- map["link"]
        location                <- map["location"]
        users_in_photo          <- map["users_in_photo"]
    }
}

struct Comments: Mappable {
    var count: Int?
    
    init?(map: Map) {
        
    }
    
    // Mappable
    mutating func mapping(map: Map) {
        count              <- map["count"]
    }
}

struct Likes: Mappable {
    var count: Int?
    
    init?(map: Map) {
        
    }
    
    // Mappable
    mutating func mapping(map: Map) {
        count              <- map["count"]
    }
}

struct User: Mappable {
    var userId: String?
    var full_name: String?
    var profile_picture: String?
    var username: String?

    init?(map: Map) {

    }

    // Mappable
    mutating func mapping(map: Map) {
        userId              <- map["id"]
        full_name           <- map["full_name"]
        profile_picture     <- map["profile_picture"]
        username            <- map["username"]
    }
}

struct ImageModel: Mappable {
    var thumbnail: ImageInfo?
    var low_resolution: ImageInfo?
    var standard_resolution: ImageInfo?

    init?(map: Map) {

    }

    // Mappable
    mutating func mapping(map: Map) {
        thumbnail              <- map["thumbnail"]
        low_resolution         <- map["low_resolution"]
        standard_resolution    <- map["standard_resolution"]
    }
}

struct ImageInfo: Mappable {
    var width: Int?
    var height: Int?
    var url: String?

    init?(map: Map) {

    }

    // Mappable
    mutating func mapping(map: Map) {
        width               <- map["width"]
        height              <- map["height"]
        url                 <- map["url"]
    }
}

struct Location: Mappable {
    var latitude: Double?
    var longitude: Double?
    var name: String?
    var locationId: Int?

    init?(map: Map) {

    }

    // Mappable
    mutating func mapping(map: Map) {
        latitude            <- map["latitude"]
        longitude           <- map["longitude"]
        name                <- map["name"]
        locationId          <- map["id"]
    }
}

struct Meta: Mappable {
    var code: Int?

    init?(map: Map) {

    }

    // Mappable
    mutating func mapping(map: Map) {
        code              <- map["code"]
    }
}

struct Caption: Mappable {
    var captionId: String?
    var text: String?
    var created_time: String?
    var from: User?

    init?(map: Map) {

    }

    // Mappable
    mutating func mapping(map: Map) {
        captionId           <- map["id"]
        text                <- map["text"]
        created_time        <- map["created_time"]
        from                <- map["from"]
    }
}

struct MediaSearchModel: Mappable {
    var data: [MediaData]?
    var meta: Meta?

    init?(map: Map) {

    }

    // Mappable
    mutating func mapping(map: Map) {
        data            <- map["data"]
        meta            <- map["meta"]
    }
}
