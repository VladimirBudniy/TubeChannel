//
//  ChannelController.swift
//  TubeChannel
//
//  Created by Vladimir Budniy on 2/28/17.
//  Copyright © 2017 Vladimir Budniy. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

class ChannelController: UIViewController, ViewControllerRootView, LoadDelegate, UICollectionViewDataSource, UICollectionViewDelegate {

    typealias RootViewType = ChannelView
    var model = LoadModel()
    var channel: Channel?
    var videoId: String?
    var videos = [Video]()
    let identifier = String(describing: ChennalCell.self)

    var playerView: YTPlayerView? {
        get {
            return self.rootView.playerView
        }
    }

    // MARK: - Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.rootView.collectionView?.register(UINib(nibName: self.identifier, bundle: nil), forCellWithReuseIdentifier: self.identifier)
        self.rootView.fillwith(channel: self.channel)
        self.model.delegate = self
        self.model.loadPlaylist(channel: self.channel)
    }
    
    // MARK: - Loading Model Delegate Method
    
    func videosListReady() {
        self.videos = self.model.videos
        self.rootView.collectionView?.reloadData()
    }
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.videos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.identifier, for: indexPath) as! ChennalCell
        cell.fillWithModel(model: self.videos[indexPath.row])
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let video = self.videos[indexPath.row]
        self.rootView.itemName?.text = video.title
        if let videoId = video.videoId {
            self.videoId = videoId
            self.playerView?.load(withVideoId: videoId)
        }
    }
}
