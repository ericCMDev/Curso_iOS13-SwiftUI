//
//  ContentView.swift
//  02-images
//
//  Created by Eric Cabestany Mena on 20/09/2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image("newyork").resizable()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
