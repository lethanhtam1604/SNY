//
//  NewsFeedPhotoViewModel.swift
//  SNY
//
//  Created by Thanh-Tam Le on 06/04/2019.
//  Copyright © 2019 Thanh-Tam Le. All rights reserved.
//

import UIKit

protocol NewsFeedPhotoViewModelProtocol: class {
    
    init(newsFeedPhoto: NewsFeedPhoto?)
    func getImageURL() -> String?
    func getWidth() -> Double?
    func getHeight() -> Double?
    func getRatio() -> Double
}

class NewsFeedPhotoViewModel: NewsFeedPhotoViewModelProtocol {
    
    // MARK: - Variables
    private var newsFeedPhoto: NewsFeedPhoto?

    // MARK: - Inititalization
    required init(newsFeedPhoto: NewsFeedPhoto?) {
        self.newsFeedPhoto = newsFeedPhoto
    }
    
    func getImageURL() -> String? {
        return newsFeedPhoto?.imageURL
    }
    
    func getWidth() -> Double? {
        return newsFeedPhoto?.width
    }
    
    func getHeight() -> Double? {
        return newsFeedPhoto?.height
    }
    
    func getRatio() -> Double {
        return (newsFeedPhoto?.width ?? 0) / (newsFeedPhoto?.height ?? 0)
    }
}
