//
//  ContentView.swift
//  01-first_app
//
//  Created by Eric Cabestany Mena on 19/09/2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//Si usamos .fot(largetitle) por ejemplo, cuando el usuario cambie el tamaño de su texto el el dispositivo se redimensionará haciéndose má grande o más pequeño de manera dinámica. Si por otra parte queremos que sea texto con tamaño fijo, haremos .size(35)
        Text("Hello, world!")
            .font(.largeTitle)
            .foregroundColor(.blue)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
