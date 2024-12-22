//
//  RootView.swift
//  swiggysample
//
//  Created by Noor Ahmed on 22/12/24.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        NavigationStack {
            HomeView()
        }
        .tint(.orange)
    }
}

#Preview {
    RootView()
}
