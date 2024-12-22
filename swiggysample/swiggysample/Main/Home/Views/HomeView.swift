//
//  HomeView.swift
//  swiggysample
//
//  Created by Noor Ahmed on 22/12/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel = .init()
    @State private var showHeader: Bool = true
    @State private var lastMainScrollOffset: CGFloat = 0
    private let horizontalPadding: CGFloat = 12
    private var rowsMenuSuggestion: [GridItem] = [.init(.fixed(72)), .init(.fixed(72))]
    var body: some View {
        VStack(spacing: 4) {
            headerView
            ScrollView {
                contentView
                    .padding(.vertical, 12)
                    .offsetReader(in: .named(ScrollViewCoordinateSpace.homeMainScrollView.rawValue)) { position in
                        print(position)
                        if position > 80 {
                            viewModel.pulledForRefresh = true
                        }
                        withAnimation(.linear) {
                            self.showHeader = lastMainScrollOffset < position
                        }
                        print(showHeader)
                        self.lastMainScrollOffset = position
                    }
            }
            .coordinateSpace(name: ScrollViewCoordinateSpace.homeMainScrollView.rawValue)
        }
        .navigationDestination(item: $viewModel.selectedRestaurant) { restaurant in
            RestaurantDetailsView(viewModel: .init(data: restaurant))
        }
    }
    
    var contentView: some View {
        VStack(spacing: 16) {
            if viewModel.pulledForRefresh {
                activityIndicatorView
            }
            bannerView
            menuSuggestionView
            restaurantListView
        }
    }

    // Activity Indicator
    var activityIndicatorView: some View {
        ProgressView()
            .tint(.orange)
            .task {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    viewModel.pulledForRefresh = false
                }
            }
    }
    
    var mainViewWithSection: some View {
        LazyVStack(spacing: 16, pinnedViews: [.sectionHeaders]) {
            Section(content: {
                contentView
            }, header: {
                headerView
            })
        }
    }
    
}

// MARK: - Header View

extension HomeView {
    var headerView: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    (
                        Text(viewModel.selectedAddress.title+" ") +
                        Text(Image(systemName: "chevron.down"))
                    )
                    .foregroundStyle(.black)
                    .font(.body)
                    .isMenu(options: viewModel.addressData.map{ $0.title} ) { selected in
                        if let index = viewModel.addressData.firstIndex(where: {$0.title == selected}) {
                            viewModel.selectedAddress = viewModel.addressData[index]
                        }
                        
                    }
                    Text(viewModel.selectedAddress.location)
                        .font(.caption)
                        .foregroundStyle(.gray)
                        .multilineTextAlignment(.leading)
                        .lineLimit(1)
                }
                Spacer()
                Image(systemName: "person.crop.circle.fill")
                    .isIcon(size: 32)
            }
            TextField("Search", text: $viewModel.searchText)
                .textFieldStyle(SearchTextFieldStyle())
        }
        .padding(.horizontal, horizontalPadding)
        .padding(.vertical)
        .background {
            Color.white
                .shadow(color: .gray.opacity(0.2), radius: 2, y: 5)
        }
    }
}

// MARK: - Banner View

extension HomeView {
    var bannerView: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 0) {
                ForEach(viewModel.bannerData) { data in
                    bannerCellView(data: data)
                }
            }
        }
        .scrollIndicators(.hidden)
        .scrollTargetBehavior(.paging)
    }

    func bannerCellView(data: BannerModel) -> some View {
        ZStack {
            Color.orange
            Text(data.title ?? "Empty")
                .foregroundStyle(.white)
                .font(.title2)
        }
        .cornerRadius(16)
        .padding(.horizontal, horizontalPadding)
        .frame(width: ScreenSize.width, height: 150)
    }
}

// MARK: - Menu View

extension HomeView {
    var menuSuggestionView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rowsMenuSuggestion, spacing: 8) {
                ForEach(viewModel.menuSuggestionData) { data in
                    menuSuggestionCellView(data: data)
                }
            }
            .padding(.horizontal, horizontalPadding)
        }
    }

    func menuSuggestionCellView(data: MenuItemModel) -> some View {
        VStack {
            Image(systemName: data.icon)
                .isIcon(size: 32)
                .foregroundStyle(.orange)
            Text(data.name)
        }
    }
}

// MARK: - Restaurant List View

extension HomeView {
    var restaurantListView: some View {
        LazyVStack {
            ForEach(viewModel.restaurantData) { data in
                restaurantListCellView(data: data)
                    .onTapGesture {
                        viewModel.selectedRestaurant = data
                    }
            }
        }
        .padding(.horizontal, horizontalPadding)
    }

    func restaurantListCellView(data: RestaurantModel) -> some View {
        HStack(spacing: 32) {
            Image(data.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 64)
                .frame(maxHeight: .infinity)
            VStack(alignment: .leading) {
                Text(data.name)
                    .font(.headline)
                HStack(spacing: 4) {
                    Image(systemName: "star.circle.fill")
                        .isIcon(size: 16)
                        .foregroundStyle(.green)
                    Text(String(format: "%.1f", data.rating))
                        .font(.subheadline)
                }
                Text(data.location)
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
        }
        .padding(.horizontal, horizontalPadding)
        .frame(height: 150)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    HomeView()
}
