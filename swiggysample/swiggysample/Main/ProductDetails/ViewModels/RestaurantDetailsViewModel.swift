//
//  RestaurantDetailsViewModel.swift
//  swiggysample
//
//  Created by Noor Ahmed on 22/12/24.
//

import Foundation

class RestaurantDetailsViewModel: ObservableObject {
    @Published var details: RestaurantModel?
    
    init(data: RestaurantModel? = nil) {
        self.details = data
    }
}
