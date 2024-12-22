//
//  SearchTextFieldStyle.swift
//  swiggysample
//
//  Created by Noor Ahmed on 22/12/24.
//

import SwiftUI

struct SearchTextFieldStyle: TextFieldStyle {
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        HStack(spacing: 4) {
            configuration
            HStack(spacing: 12) {
                Image(systemName: "magnifyingglass")
                    .isIcon(size: 16)
                Color.gray.opacity(0.5)
                    .frame(width: 1, height: 24)
                Image(systemName: "mic.fill")
                    .isIcon(size: 16)
                    .foregroundStyle(.orange)
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 16)
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(.gray.opacity(0.5), lineWidth: 1)
        }
    }
}
