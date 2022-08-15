//
//  Transaction.swift
//  P3-WalletApp
//
//  Created by Eric Cabestany Mena on 11/8/22.
//

import Foundation
import SwiftUI


struct Transaction: Identifiable {
    var id = UUID()
    var seller : String
    var amount: Double
    var date: String
    var icon: String = "dollarsign.circle.fill"
}


let transactions = [
    
    Transaction(seller: "Amazon", amount: 13.99, date: "06/03/2022"),
    Transaction(seller: "Carrefour", amount: 79.85, date: "08/10/2022", icon: "cart.fill"),
    Transaction(seller: "Apple", amount: 1159.90, date: "01/02/2022", icon: "applelogo"),
    Transaction(seller: "HBO Max", amount: 7.99, date: "01/07/2022", icon: "tv.fill")
]
