//
//  HomeViewModel.swift
//  swiggysample
//
//  Created by Noor Ahmed on 22/12/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var bannerData: [BannerModel] = [.init(index: 0, title: "Test 1"),
                                                .init(index: 1, title: "Test 2"),
                                                .init(index: 2, title: "Test 3")]
    @Published var addressData: [AddressModel] = [
        .init(title: "Office", location: "here is your office location", type: "OFFICE"),
        .init(title: "Work", location: "here is your work location", type: "WORK"),
        .init(title: "Home", location: "here is your home location", type: "HOME")
    ]
    @Published var restaurantData: [RestaurantModel] = [.init(name: "Suprem"),
                                                        .init(name: "Gopal"),
                                                        .init(name: "City corner")]
    @Published var pulledForRefresh: Bool = false
    @Published var selectedAddress: AddressModel = AddressModel.currentLocation
    @Published var searchText: String = ""
    @Published var selectedRestaurant: RestaurantModel? = nil

    var menuSuggestionData: [MenuItemModel] {
        var data: [MenuItemModel] = []
        for i in 0..<20 {
            data.append(.init(id: i, name: "Burger \(i)", icon: "burn"))
        }
        return data
    }
}
