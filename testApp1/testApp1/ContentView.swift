//
//  ContentView.swift
//  testApp1
//
//  Created by Eric Cabestany Mena on 14/2/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hola, Eric!")
            .fontWeight(.bold)
            .background(.black)
            .font(.system(.largeTitle, design: .rounded))
            .foregroundColor(.purple)
            .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
