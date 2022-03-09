//
//  ContentView.swift
//  StateAndBindingApp
//
//  Created by Eric Cabestany Mena on 9/3/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image(systemName: "play.circle.fill")
            .font(.system(size: 100))
            .foregroundColor(.blue)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
