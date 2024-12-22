//
//  RestaurantModel.swift
//  swiggysample
//
//  Created by Noor Ahmed on 22/12/24.
//

import Foundation

struct RestaurantModel: Identifiable, Hashable {
    var id: UUID = UUID()
    var name: String
    var rating: Double = 4.4
    var location: String = "this is restaurants location"
    var image: String = "Restuarant"
    var isFav: Bool = false
    
    var ratingString: String {
        String(format: "%.1f", rating)
    }
}
