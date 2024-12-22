//
//  BannerModel.swift
//  swiggysample
//
//  Created by Noor Ahmed on 22/12/24.
//

import Foundation

struct BannerModel: Identifiable {
    var index: Int
    var title: String?
    var image: String?
    var id: Int {
        return index
    }
}
