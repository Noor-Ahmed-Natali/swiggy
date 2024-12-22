//
//  SizeConstants.swift
//  swiggysample
//
//  Created by Noor Ahmed on 22/12/24.
//

import SwiftUI

struct ScreenSize {
    
    static let width: CGFloat = UIScreen.main.bounds.size.width
    
    static let height: CGFloat = UIScreen.main.bounds.size.height
    
    static let navigationBarHeight: CGFloat = 44

    static let tabbarHeight: CGFloat = 50
    
    static let safeAreaTop: CGFloat =  UIApplication.shared.windows[0].safeAreaInsets.top
    
    static let safeAreaBottom: CGFloat = UIApplication.shared.windows[0].safeAreaInsets.bottom
    
    static let safeAreaHorizontal: CGFloat = UIApplication.shared.windows[0].safeAreaInsets.left + UIApplication.shared.windows[0].safeAreaInsets.right
    
    static var heightWithoutSafeArea: CGFloat {
        get {
              self.height - (self.safeAreaTop + self.safeAreaBottom)
        }
    }
    
    static var mainCardHeight: CGFloat  {
        get {
            (ScreenSize.height - (self.safeAreaTop + self.safeAreaBottom)) * 0.85
        }
    }
    
    static var mainPadding: CGFloat {
        get {
           return  self.width * 0.1
        }
    }
    
    static var cardSize: CGSize {
        let width = Self.width - 48
        let height = width * 1.8
        return .init(width: width, height: height)
    }
    
}
