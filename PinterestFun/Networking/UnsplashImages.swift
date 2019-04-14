//
//  UnsplashImages.swift
//  PinterestFun
//
//  Created by argenis delarosa on 4/13/19.
//  Copyright © 2019 argenis delarosa. All rights reserved.
//

import Foundation

typealias Photos = [Photo]

struct Photo: Codable {
    let id: String
    let urls: URLS
}

enum URLS: String, Codable {
    case raw, full, regular, small, thumb
}
