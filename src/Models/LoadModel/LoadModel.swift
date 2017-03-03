//
//  LoadModel.swift
//  TubeChannel
//
//  Created by Vladimir Budniy on 3/1/17.
//  Copyright © 2017 Vladimir Budniy. All rights reserved.
//

import Foundation
import Alamofire

protocol LoadDelegate {
    func channelsListReady()
    func videosListReady()
}

extension LoadDelegate {
    func channelsListReady() {
        
    }
    
    func videosListReady() {
        
    }
}

class LoadModel: NSObject {
    var delegate: LoadDelegate?
    var pageToken = ""
    var channels = [Channel]()
    var videos = [Video]()
    
    // MARK: - Public
    
    func loadChannels() {
        let paths = Paths()
        let constants = StringConstants()
        let parameters = [constants.part: constants.snippet,
                          constants.id: paths.channelIds,
                          constants.maxResults: itemsPerPage,
                          constants.key: paths.APIKey] as [String : Any]
        
        Alamofire.request(paths.channels,
                          method: HTTPMethod.get,
                          parameters: parameters,
                          encoding: URLEncoding.default,
                          headers: nil).responseJSON { (response) in
                            if let JSON = response.result.value as? [String: Any] {
                                self.channels = parsChannelsJSON(JSON: JSON)
                            }
                            
                            if self.delegate != nil {
                                self.delegate?.channelsListReady()
                            }
        }
    }
    
    func loadPlaylist(channel: Channel?) {
        let paths = Paths()
        let constants = StringConstants()
        if let channel = channel {
            if let playlistId = self.playlistId(from: channel.id) {
                let parameters = [constants.part: constants.snippet,
                                  constants.playlistId: playlistId,
                                  constants.maxResults: itemsPerPage,
                                  constants.key: paths.APIKey] as [String : Any]
                
                Alamofire.request(paths.channelItems,
                                  method: HTTPMethod.get,
                                  parameters: parameters,
                                  encoding: URLEncoding.default,
                                  headers: nil).responseJSON { (response) in
                                    if let JSON = response.result.value as? [String: Any] {
                                        self.videos = parsVideosJSON(JSON: JSON, for: channel)
                                    }
                                    
                                    if self.delegate != nil {
                                        self.delegate?.videosListReady()
                                    }
                }
            }
        }
    }
   
    // MARK: - Fileprivate
    
    fileprivate func playlistId(from channelId: String?) -> String? {
        var playlistId: String?
        if let channelId = channelId {
            let range = channelId.range(of: "C")
            playlistId = channelId.replacingCharacters(in: range!, with: "U")
        }
        
        return playlistId
    }
}
