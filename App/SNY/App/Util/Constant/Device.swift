//
//  Device.swift
//  SNY
//
//  Created by Thanh-Tam Le on 31/10/2018.
//  Copyright © 2018 Thanh-Tam Le. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Device Types
public let IS_IPHONE = UIDevice.current.userInterfaceIdiom == .phone
public let IS_IPAD = UIDevice.current.userInterfaceIdiom == .pad
public let IS_IPHONE4ORLESS = UIDevice.current.userInterfaceIdiom == .phone && SCREENMAXLENGTH < 568.0
public let IS_IPHONE5 = UIDevice.current.userInterfaceIdiom == .phone && SCREENMAXLENGTH == 568.0
public let IS_IPHONE6 = UIDevice.current.userInterfaceIdiom == .phone && SCREENMAXLENGTH == 667.0
public let IS_IPHONE6P = UIDevice.current.userInterfaceIdiom == .phone && SCREENMAXLENGTH == 736.0
public let IS_IPHONEX = UIDevice.current.userInterfaceIdiom == .phone && SCREENMAXLENGTH == 812.0
public let IS_IPHONEXS_MAX = UIDevice.current.userInterfaceIdiom == .phone && SCREENMAXLENGTH == 896.0
