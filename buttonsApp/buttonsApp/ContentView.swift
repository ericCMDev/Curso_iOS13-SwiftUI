//
//  ContentView.swift
//  buttonsApp
//
//  Created by Eric Cabestany Mena on 1/3/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       
        Button (action: {
            //Què farà el botó
            print("Botón hola pulsado")
        }) {
            //Com es veurà el botó
            Text("Hola Mundo")
        }


    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
