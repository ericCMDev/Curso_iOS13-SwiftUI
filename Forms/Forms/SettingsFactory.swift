//
//  SettingsFactory.swift
//  Forms
//
//  Created by Eric Cabestany Mena on 3/7/22.
//

import Foundation
import Combine

final class SettingsFactory: ObservableObject {
    
    @Published var defaults: UserDefaults
    
    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
        
        defaults.register(defaults: [
        //valors per defecte el primer cop que arranca la app i que l'usuari no ha posat cap valor per guardar
            "app.view.settings.order": 0,
            "app.view.settings.showPurchased": false,
            "app.view.settings.price": 5
            
            
        ])
    }
    
    var order: SortingOrderType {
        get {
            SortingOrderType(type: defaults.integer(forKey: "app.view.settings.order"))
        }
        set {
            defaults.set(newValue.rawValue, forKey: "app.view.settings.order")
        }
    }
    var showPurchased : Bool {
        get {
            defaults.bool(forKey: "app.view.settings.showPurchased")
        }
        set {
            defaults.set(newValue, forKey: "app.view.settings.showPurchased")
        }
    }
    var price: Int {
        get {
            defaults.integer(forKey: "app.view.settings.price")
        }
        set {
            defaults.set(newValue, forKey: "app.view.settings.price")
        }
    }
    
    
}
