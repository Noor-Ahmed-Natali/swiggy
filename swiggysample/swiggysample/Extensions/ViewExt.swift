//
//  ViewExt.swift
//  swiggysample
//
//  Created by Noor Ahmed on 22/12/24.
//

import SwiftUI

extension View {

    func offsetReader(in coodinator: CoordinateSpace, position: @escaping (CGFloat) -> Void) -> some View {
        self
            .background {
                GeometryReader { geo in
                    Color.clear.onChange(of: geo.frame(in: coodinator).minY) { val in
                        position(val)
                    }
                }
            }
    }
    
    func readSize(size: @escaping (CGSize) -> Void) -> some View {
        self
            .background {
                GeometryReader { reader in
                    Color.clear
                        .preference(key: SizePreferenceKey.self, value: reader.size)
                }
            }
            .onPreferenceChange(SizePreferenceKey.self, perform: { val in
                guard let val = val else { return }
                size(val)
            })
    }

    func isMenu<T: Hashable>(options: [T], with: String? = nil, action: @escaping (T) -> Void) -> some View {
        self.modifier(MenuModifier(options: options, action: action, lables: { item in
            Text(item as? String ?? "\(item)")
        }))
    }

    func isMenu<T: Hashable, V: View>(options: [T], view: @escaping (T) -> V, action: @escaping (T) -> Void) -> some View {
        self.modifier(MenuModifier(options: options, action: action, lables: view))
    }
}

