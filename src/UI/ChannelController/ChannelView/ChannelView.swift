//
//  ChannelView.swift
//  TubeChannel
//
//  Created by Vladimir Budniy on 2/28/17.
//  Copyright © 2017 Vladimir Budniy. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

class ChannelView: UIView, YTPlayerViewDelegate  {
    
    @IBOutlet var playerView: YTPlayerView?
    @IBOutlet var collectionView: UICollectionView?
    @IBOutlet var channelAvater: UIImageView?
    @IBOutlet var channelName: UILabel?
    @IBOutlet var itemName: UILabel?
    @IBOutlet var descriptionText: UITextView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.playerView?.delegate = self
    }
    
    // MARK: - Public

    func loadView(from model: Video?) {
        
    }
    
    func fillwith(channel: Channel?) {
        if let imageURL = channel?.imageUrl {
            self.channelAvater?.sd_setImage(with: URL(string: imageURL))
        }
        self.channelName?.text = channel?.title
        self.descriptionText?.text = channel?.description
    }
    
    // MARK: YTPlayerViewDelegate
    
    func playerView(_ playerView: YTPlayerView, didChangeTo state: YTPlayerState) {
        switch state {
        case .unstarted:
            print("Unstarted")
        case .playing:
            print("Playing")
        case .paused:
            print("Paused")
        case .ended:
            print("Ended")
        default:
            break
        }
    }
    
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {

    }
    
    func playerView(_ playerView: YTPlayerView, didPlayTime playTime: Float) {
        print("Play time - \(playTime)")
    }
    
    func playerView(_ playerView: YTPlayerView, didChangeTo quality: YTPlaybackQuality) {
        switch quality {
        case .small:
            print("Small Quality")
        case .medium:
            print("Medium Quality")
        case .large:
            print("Large Quality")
        case .HD720:
            print("HD720 Quality")
        case .HD1080:
            print("HD1080 Quality")
        case .highRes:
            print("HighRes Quality")
        case .auto:
            print("Auto Quality")
        case .unknown:
            print("Default Quality")
        default:
            print("Unknown Quality")
        }
    }
}
