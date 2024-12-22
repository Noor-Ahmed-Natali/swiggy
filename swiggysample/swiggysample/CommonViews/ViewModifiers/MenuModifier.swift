//
//  MenuModifier.swift
//  swiggysample
//
//  Created by Noor Ahmed on 22/12/24.
//

import SwiftUI

struct MenuModifier<T: Hashable, V: View>: ViewModifier {
    let options: [T]
    var action: (T) -> Void
    var lables: (T) -> V
    
    func body(content: Content) -> some View {
        Menu(content: {
            ForEach(options, id: \.self) { item in
                Button(action: {
                    action(item)
                }, label: {
                    lables(item)
                })
            }
        }, label: {
            content
        })
    }
}
