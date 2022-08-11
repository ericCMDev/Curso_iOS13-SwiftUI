//
//  Extensions.swift
//  P2-Tinder
//
//  Created by Eric Cabestany Mena on 11/8/22.
//

import Foundation
import SwiftUI


extension AnyTransition {
    static var trailingBottomAtRemoval: AnyTransition {
        AnyTransition.asymmetric(insertion: .identity,
                                 removal: AnyTransition.move(edge: .trailing).combined(with: .move(edge: .bottom)))
    }
    
    static var leadingBottomAtRemoval: AnyTransition {
        AnyTransition.asymmetric(insertion: .identity,
                                 removal: AnyTransition.move(edge: .leading).combined(with: .move(edge: .bottom)))
    }
    
    
}
