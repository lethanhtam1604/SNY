//
//  NewsFeedCell.swift
//  SNY
//
//  Created by Thanh-Tam Le on 15/11/2018.
//  Copyright © 2018 Thanh-Tam Le. All rights reserved.
//

import UIKit
import SkeletonView

class NewsFeedCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet private weak var thumbnailImgView             : UIImageView!
    @IBOutlet private weak var titleLabel                   : UILabel!
    @IBOutlet private weak var dateTimeLabel                : UILabel!
    @IBOutlet private weak var detailTV                     : UITextView!
    @IBOutlet private weak var photoImgView                 : UIImageView!
    @IBOutlet private weak var heightPhotoImgViewConstraint : NSLayoutConstraint!
    
    // MARK: - Variables
    static var identifier = "NewsFeedCell"
    internal var newsFeedViewModel: NewsFeedViewModel? {
        didSet {
            showSkeletonAnimation()
            let photoViewModel = newsFeedViewModel?.getPhotoViewModel()
            thumbnailImgView.loadImagesUsingUrlString(urlString: newsFeedViewModel?.getThumbnailURL() ?? "") {
                self.photoImgView.loadImagesUsingUrlString(urlString: photoViewModel?.getImageURL() ?? "") {
                    self.hideSkeletonAnimation()
                    let imageRatio  = photoViewModel?.getRatio() ?? 1
                    let imageWidth  = Double(SCREEN_WIDTH)
                    let imageHeight = imageWidth / imageRatio
                    self.heightPhotoImgViewConstraint.constant = CGFloat(imageHeight)
                    self.photoImgView.isHidden = false
                    self.titleLabel.text       = self.newsFeedViewModel?.getTitle()
                    self.dateTimeLabel.text    = self.newsFeedViewModel?.getDateTime()
                    self.detailTV.text         = self.newsFeedViewModel?.getDetail()
                }
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
extension NewsFeedCell {
    
    private func initCommon() {
        thumbnailImgView.layer.masksToBounds        = true
        thumbnailImgView.layer.cornerRadius         = 20
        //detailTV.textContainer.maximumNumberOfLines = 5
        detailTV.textContainerInset                 = .zero
        detailTV.textContainer.lineFragmentPadding  = 0
        //detailTV.translatesAutoresizingMaskIntoConstraints  = false
        detailTV.sizeToFit()
    }
    
    internal func showSkeletonAnimation() {
        titleLabel.linesCornerRadius    = 5
        dateTimeLabel.linesCornerRadius = 5
        detailTV.linesCornerRadius      = 5
        [thumbnailImgView, titleLabel, dateTimeLabel, detailTV].forEach {
            $0?.showAnimatedGradientSkeleton()
        }
    }
    
    internal func hideSkeletonAnimation() {
        [thumbnailImgView, titleLabel, dateTimeLabel, detailTV].forEach {
            $0?.hideSkeleton()
        }
    }
}

// MARK: - Functionalities
extension NewsFeedCell {
    
    internal func heightOfCell(_ newsFeedViewModel: NewsFeedViewModel?) -> CGFloat {
        let titleHeight       = newsFeedViewModel?.getTitle()?.heightOfString(withConstrainedWidth: SCREEN_WIDTH - 20 - 40 - 10, font: titleLabel.font) ?? 0
        let dateHeight        = newsFeedViewModel?.getDateTime()?.heightOfString(withConstrainedWidth: SCREEN_WIDTH - 20 - 40 - 10, font: dateTimeLabel.font) ?? 0
        let thumbnailHeight   = CGFloat(40)
        let topContentsHeight = titleHeight + 5 + dateHeight
        let topViewHeight     = 10 + 10 + (topContentsHeight > thumbnailHeight ? topContentsHeight : thumbnailHeight) + 10
        let detailHeight      = calculatingDetailHeight(newsFeedViewModel)
        let photoViewModel    = newsFeedViewModel?.getPhotoViewModel()
        let imageRatio        = photoViewModel?.getRatio() ?? 1
        let imageWidth        = Double(SCREEN_WIDTH)
        let imageHeight       = CGFloat(10 + imageWidth / imageRatio)
        let totalHeight       = CGFloat(topViewHeight + detailHeight + imageHeight + 10)
        return totalHeight.rounded(.up)
    }
    
    private func calculatingDetailHeight(_ newsFeedViewModel: NewsFeedViewModel?) -> CGFloat {
        var detailHeight      = CGFloat(5) + (newsFeedViewModel?.getDetail()?.heightOfString(withConstrainedWidth: SCREEN_WIDTH - 20, font: detailTV.font ?? UIFont.systemFont(ofSize: 14)) ?? CGFloat(0)) + CGFloat(20)
        let heightOfLines = (detailTV.font?.lineHeight ?? 0) * 5
        detailHeight = detailHeight <= heightOfLines ? detailHeight : heightOfLines
        return detailHeight
    }
}
