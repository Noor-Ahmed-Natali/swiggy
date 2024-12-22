//
//  AddressModel.swift
//  swiggysample
//
//  Created by Noor Ahmed on 22/12/24.
//

import Foundation

struct AddressModel: Identifiable, Hashable, Equatable {
    var title: String
    var location: String
    var type: String?
    
    var id: String { title }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.title == rhs.title
    }
    
    static let currentLocation: Self = .init(title: "Current Location", location: "Here is your current location")
}
