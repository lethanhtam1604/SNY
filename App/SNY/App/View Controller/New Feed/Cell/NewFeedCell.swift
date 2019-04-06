//
//  NewFeedCell.swift
//  SNY
//
//  Created by Thanh-Tam Le on 15/11/2018.
//  Copyright © 2018 Thanh-Tam Le. All rights reserved.
//

import UIKit
import SkeletonView

class NewFeedCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet private weak var thumbnailImgView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var dateTimeLabel: UILabel!
    @IBOutlet private weak var detailLabel: UILabel!
    @IBOutlet private weak var photoImgView: UIImageView!
    @IBOutlet private weak var heightPhotoImgViewCnstraint: NSLayoutConstraint!
    
    // MARK: - Variables
    static var identifier = "NewFeedCell"
    
    private var newFeedViewModel: NewFeedViewModel? {
        didSet {
            thumbnailImgView.loadImagesUsingUrlString(urlString: newFeedViewModel?.getThumbnailURL() ?? "")
            titleLabel.text = newFeedViewModel?.getTitle()
            dateTimeLabel.text = newFeedViewModel?.getDateTime()
            detailLabel.text = newFeedViewModel?.getDetail()
        }
    }
    
    // MARK: - View Cycle
    override func awakeFromNib() {
        super.awakeFromNib()

        initCommon()
    }
    
    private var height: CGFloat = 0

    
    func bindingData(newFeedViewModel: NewFeedViewModel?, complete: (() -> ())? = nil) {
        showSkeletonAnimation()
        photoImgView.loadImagesUsingUrlString(urlString: newFeedViewModel?.getImageURL() ?? "") {
            self.hideSkeletonAnimation()
            self.newFeedViewModel = newFeedViewModel
            
            let imageSize = self.photoImgView?.image?.size
            let ratio = CGFloat(imageSize?.width ?? 0) / CGFloat(imageSize?.height ?? 0)
            self.height = SCREEN_WIDTH / ratio
            self.heightPhotoImgViewCnstraint.constant = self.height
            complete?()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.titleLabel.preferredMaxLayoutWidth = self.titleLabel.frame.size.width
        self.dateTimeLabel.preferredMaxLayoutWidth = self.dateTimeLabel.frame.size.width
        self.detailLabel.preferredMaxLayoutWidth = self.detailLabel.frame.size.width
//        self.photoImgView.preferredFocusedView = self.photoImgView
    }
}

// MARK: - Setup Cell
extension NewFeedCell {
    
    private func initCommon() {
        thumbnailImgView.layer.masksToBounds = true
        thumbnailImgView.layer.cornerRadius = 20
    }
    
    private func showSkeletonAnimation() {
        titleLabel.linesCornerRadius = 5
        dateTimeLabel.linesCornerRadius = 5
        detailLabel.linesCornerRadius = 5
        [thumbnailImgView, titleLabel, dateTimeLabel, detailLabel].forEach {
            $0?.showAnimatedGradientSkeleton()
        }
    }
    
    private func hideSkeletonAnimation() {
        [thumbnailImgView, titleLabel, dateTimeLabel, detailLabel].forEach {
            $0?.hideSkeleton()
        }
    }
}
