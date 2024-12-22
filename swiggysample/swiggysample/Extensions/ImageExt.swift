//
//  ImageExt.swift
//  swiggysample
//
//  Created by Noor Ahmed on 22/12/24.
//

import SwiftUI

extension Image {

    func isIcon(size: CGFloat = 24) -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: size, height: size)
    }
}
