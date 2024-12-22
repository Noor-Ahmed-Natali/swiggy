//
//  RestaurantDetailsView.swift
//  swiggysample
//
//  Created by Noor Ahmed on 22/12/24.
//

import SwiftUI

struct RestaurantDetailsView: View {
    @ObservedObject var viewModel: RestaurantDetailsViewModel
    private let horizontalPadding: CGFloat = 24
    var body: some View {
        if let data = viewModel.details {
            mainView
        } else {
            Text("No Data Found")
        }
    }
    
    var mainView: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                imageSectionView
                    .clipped()
                detailsSectionView
                Spacer()
            }
        }
        .navigationTitle("")
        .toolbarRole(.editor)
        .scrollIndicators(.hidden)
    }
    
    var imageSectionView: some View {
        GeometryReader { geo in
            if let image = viewModel.details?.image {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geo.size.width, height: geo.size.height)
            }
        }
        .frame(height: ScreenSize.height*0.4)
    }
    
    var detailsSectionView: some View {
        VStack(alignment: .leading) {
            if let name = viewModel.details?.name {
                Text(name)
                    .font(.largeTitle)
                    .bold()
            }
            if let address = viewModel.details?.location {
                Text(address)
                    .font(.headline)
                    .foregroundStyle(.gray)
            }
            if let rating = viewModel.details?.ratingString {
                HStack {
                    Image(systemName: "star.circle.fill")
                        .isIcon()
                        .foregroundStyle(.green)
                    Text(rating)
                        .font(.title3)
                        .bold()
                }
            }
        }
        .padding(.horizontal, horizontalPadding)
    }
    
}

#Preview {
    RestaurantDetailsView(viewModel: .init(data: .init(name: "Sample")))
}
