//
//  ContentView.swift
//  testOne
//
//  Created by Eric Cabestany Mena on 15/2/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .fontWeight(.bold)
            .font(.system(.largeTitle).monospaced())
            .foregroundColor(.blue)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
