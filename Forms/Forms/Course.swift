//
//  Course.swift
//  Forms
//
//  Created by Eric Cabestany Mena on 21/6/22.
//

import Foundation

struct Course: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var type: String
    var priceLevel: Int
    var featured: Bool = false
    var purchased: Bool = false
}
