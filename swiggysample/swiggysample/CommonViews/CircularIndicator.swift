//
//  CircularIndicator.swift
//  swiggysample
//
//  Created by Noor Ahmed on 22/12/24.
//

import SwiftUI

struct CircularIndicator: View {
    var indicatorCount: Int
    var selectedIndex: Int
    let size: CGFloat = 16
    var body: some View {
        ScrollViewReader { reader in
            ScrollView(.horizontal) {
                HStack(spacing: 4) {
                    Spacer(minLength: 0.0)
                    ForEach(0..<indicatorCount, id: \.self) { i in
                        Circle()
                            .stroke(Color.white.opacity(selectedIndex == i ? 1 : 0.5))
                            .scaleEffect(selectedIndex == i ? 1 : 0.75)
                            .frame(width: size, height: size)
                            .id(i)
                    }
                }
                .padding(2)
                .onChange(of: selectedIndex) { index in
                    withAnimation {
                        reader.scrollTo(index, anchor:  .center)
                    }
                }
            }
            .frame(width: 36)
            .disabled(true)
        }
    }
}

#Preview {
    CircularIndicator(indicatorCount: 4, selectedIndex: 1)
}
