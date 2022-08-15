//
//  Card.swift
//  P3-WalletApp
//
//  Created by Eric Cabestany Mena on 11/8/22.
//

import Foundation


enum CardType: String {
    case visa
    case amex
    case master
    case chase
}

struct Card: Identifiable{
    
    var id = UUID()
    var clientName: String
    var number: String
    var expirationDate: String
    var type: CardType
    var image: String
     
}


let tempCards = [

    Card(clientName: "Eric Cabestany", number: "1212 1212 1212 1212", expirationDate: "01/21", type: .visa, image: "BBVA"),
    Card(clientName: "Lidia Cara", number: "3434 3434 3434 3434", expirationDate: "06/22", type: .master, image: "gold"),
    Card(clientName: "Xisco Cabestany", number: "5656 5656 5656 5656", expirationDate: "04/23", type: .chase, image: "world"),
    Card(clientName: "Amparo Mena", number: "7878 7878 7878 7878", expirationDate: "01/29", type: .amex, image: "red")
]

