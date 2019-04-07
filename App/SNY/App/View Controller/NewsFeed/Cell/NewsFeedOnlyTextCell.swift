//
//  NewsFeedOnlyTextCell.swift
//  SNY
//
//  Created by Thanh-Tam Le on 06/04/2019.
//  Copyright © 2019 Thanh-Tam Le. All rights reserved.
//

import UIKit
import SkeletonView

class NewsFeedOnlyTextCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet private weak var photoImgView: UIImageView!
    @IBOutlet private weak var heightPhotoImgViewConstraint: NSLayoutConstraint!
    
    // MARK: - Variables
    static var identifier = "NewsFeedOnlyTextCell"
    internal var newsFeedViewModel: NewsFeedViewModel? {
        didSet {
            photoImgView.loadImagesUsingUrlString(urlString: newsFeedViewModel?.getPhotoViewModel().getImageURL() ?? "") {
                self.hideSkeletonAnimation()
                guard let imageSize = self.photoImgView?.image?.size else {
                    return
                }
                let ratio = CGFloat(imageSize.width) / CGFloat(imageSize.height)
                let height = SCREEN_WIDTH / ratio
                self.heightPhotoImgViewConstraint.constant = height
            }
        }
    }
    
    // MARK: - View Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    
        initCommon()
    }
}

// MARK: - Setup Cell
extension NewsFeedOnlyTextCell {
    
    private func initCommon() {
        //self.heightPhotoImgViewConstraint.constant = 200
        self.photoImgView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func showSkeletonAnimation() {
        [photoImgView].forEach {
            $0?.showAnimatedGradientSkeleton()
        }
    }
    
    private func hideSkeletonAnimation() {
        [photoImgView].forEach {
            $0?.hideSkeleton()
        }
    }
}
