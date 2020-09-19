//
//  ContentView.swift
//  01-first_app
//
//  Created by Eric Cabestany Mena on 19/09/2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//Si usamos .font(largetitle) por ejemplo, cuando el usuario cambie el tamaño de su texto el el dispositivo se redimensionará haciéndose más grande o más pequeño de manera dinámica. Si por otra parte queremos que sea texto con tamaño fijo, haremos .size(35)
        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas pharetra, justo nec vestibulum mattis, ligula purus sagittis ex, et ultrices neque risus ultrices metus. Integer blandit lacus tristique vehicula tempus. Proin facilisis auctor sapien, a consequat ligula fringilla eget. Sed porttitor dolor eget est ultrices bibendum.")
            .font(.body)
            .foregroundColor(.blue)
            .multilineTextAlignment(.leading)
            .lineLimit(3).truncationMode(.middle)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
