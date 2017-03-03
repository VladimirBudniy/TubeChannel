//
//  Parser.swift
//  TubeChannel
//
//  Created by Vladimir Budniy on 3/3/17.
//  Copyright © 2017 Vladimir Budniy. All rights reserved.
//

import Foundation

func parsChannelsJSON(JSON: [String: Any]?) -> [Channel] {
    var channels = [Channel]()
    let constants = StringConstants()
    if let JSON = JSON {
        for channel in JSON[constants.items] as! [[String: Any]] {
            let snippet = channel[constants.snippet] as? [String: Any]
            
            let id = channel[constants.id] as? String
            let imageUrl = urlAvatar(from: snippet, size: constants.high)
            let title = snippet?[constants.title] as? String
            let description = snippet?[constants.description] as? String
            
            channels.append(Channel(id: id, imageUrl: imageUrl, title: title, description: description))
        }
    }
    
    return channels
}

func parsVideosJSON(JSON: [String: Any]?, for channel: Channel) -> [Video] {
    let constants = StringConstants()
    var videos = [Video]()
    if let JSON = JSON {
        let nextPageToken = JSON[constants.nextPageToken] as? String
        for video in JSON[constants.items] as! [[String: Any]] {
            let snippet = video[constants.snippet] as? [String: Any]
            let resourceId = snippet?[constants.resourceId] as? [String: Any]
            let videoId = resourceId?[constants.videoId] as? String
            let imageUrl = urlAvatar(from: snippet, size: constants.standard)
            let title = snippet?[constants.title] as? String
            videos.append(Video(videoId: videoId, imageUrl: imageUrl, title: title, nextPageToken: nextPageToken, channel: channel))
        }
    }
    
    return videos
}

fileprivate func urlAvatar(from snippet: [String: Any]?, size: String) -> String? {
    let constants = StringConstants()
    let thumbnails = snippet?[constants.thumbnails] as? [String:Any]
    let imageSize = thumbnails?[size] as? [String:Any]
    
    return imageSize?[constants.url] as? String
}
