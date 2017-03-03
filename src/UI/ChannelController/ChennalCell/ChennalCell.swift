//
//  ChennalCell.swift
//  TubeChannel
//
//  Created by Vladimir Budniy on 2/28/17.
//  Copyright © 2017 Vladimir Budniy. All rights reserved.
//

import UIKit

class ChennalCell: UICollectionViewCell {

    @IBOutlet var imageView: UIImageView?
    @IBOutlet var titleLabel: UILabel?
    
    // MARK: - Initialization
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - Public
    
    func fillWithModel(model: Video) {
        self.imageView?.sd_setShowActivityIndicatorView(true)
        self.imageView?.sd_setIndicatorStyle(.gray)
        
        self.titleLabel?.text = model.title
        if let imageURL = model.imageUrl {
            self.imageView?.sd_setImage(with: URL(string: imageURL))
        }
    }
}
