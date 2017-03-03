//
//  ChannelsViewController.swift
//  TubeChannel
//
//  Created by Vladimir Budniy on 2/28/17.
//  Copyright © 2017 Vladimir Budniy. All rights reserved.
//

import UIKit

class ChannelsViewController: UICollectionViewController, ViewControllerRootView, LoadDelegate {

    typealias RootViewType = ChannelsView
    
    var model = LoadModel()
    var channels = [Channel]()
    let identifier = String(describing: ChannelsViewCell.self)
    let sequeIdentifier = "PresentChannelSeque"
    
    // MARK: - Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.clearsSelectionOnViewWillAppear = false
        self.collectionView?.register(UINib(nibName: self.identifier, bundle: nil), forCellWithReuseIdentifier: self.identifier)
        self.model.delegate = self
        self.model.loadChannels()
    }

    // MARK: - Loading Model Delegate Method
    
    func channelsListReady() {
        self.channels = self.model.channels
        self.collectionView?.reloadData()
    }
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.channels.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.identifier, for: indexPath) as! ChannelsViewCell
        cell.fillWithModel(model: self.channels[indexPath.row])
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: sequeIdentifier, sender: self.channels[indexPath.row])
    }
    
    // MARK: Override UIVieController Methods
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == sequeIdentifier {
            let controller = segue.destination as! ChannelController
            let channel = sender as! Channel
            controller.channel = channel
        }
    }
}
