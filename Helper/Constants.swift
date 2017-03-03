//
//  Constants.swift
//  TubeChannel
//
//  Created by Vladimir Budniy on 2/28/17.
//  Copyright © 2017 Vladimir Budniy. All rights reserved.
//

import Foundation

let itemsPerPage = 50

//struct ChannelId {
//    let push1sty = "UCF8NSmJLvxor5ie0RTAxOXA"
//    let alexSkutarenko = "UChR0_wfiEHRy9TQIN51H-OA"
//    let ivanAkulov = "UCXlCPCsB09ftBA5bQfiSWoQ"
//    let justDev = "UC0nOHJ-D7TBv_KG6DVHtbwQ"
//    let letsBuildThatApp = "UCuP2vJ6kRutQBfRmdcI92mA"
//    let codeWithChris = "UC2D6eRvCeMtcF5OGHf1-trw"
//}

struct Paths {
    let APIKey = "AIzaSyAXo6zm0gjCj8RoOR-oRDR5J4xj4yMGmdw"
    let channels = "https://www.googleapis.com/youtube/v3/channels"
    let channelItems = "https://www.googleapis.com/youtube/v3/playlistItems"
    let channelIds = "UCF8NSmJLvxor5ie0RTAxOXA, UChR0_wfiEHRy9TQIN51H-OA, UCXlCPCsB09ftBA5bQfiSWoQ, UC0nOHJ-D7TBv_KG6DVHtbwQ, UCuP2vJ6kRutQBfRmdcI92mA, UC2D6eRvCeMtcF5OGHf1-trw"
}

struct VideoItemsPath {
    let letsBuildThatApp = "UUuP2vJ6kRutQBfRmdcI92mA"
    let push1sty = "UUF8NSmJLvxor5ie0RTAxOXA"
    let alexSkutarenko = "UUhR0_wfiEHRy9TQIN51H-OA"
    let codeWithChris = "UU2D6eRvCeMtcF5OGHf1-trw"
    let justDev = "UU0nOHJ-D7TBv_KG6DVHtbwQ"
    let ivanAkulov = "UUXlCPCsB09ftBA5bQfiSWoQ"
}

struct StringConstants {
    let id = "id"
    let resourceId = "resourceId"
    let title = "title"
    let description = "description"
    let items = "items"
    let part = "part"
    let snippet = "snippet"
    let playlistId = "playlistId"
    let key = "key"
    let nextPageToken = "nextPageToken"
    let maxResults = "maxResults"
    let videoId = "videoId"
    let thumbnails = "thumbnails"
    let high = "high"
    let standard = "standard"
    let maxres = "maxres"
    let url = "url"
}
