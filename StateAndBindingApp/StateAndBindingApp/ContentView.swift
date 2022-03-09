//
//  ContentView.swift
//  StateAndBindingApp
//
//  Created by Eric Cabestany Mena on 9/3/22.
//

import SwiftUI

struct ContentView: View {
    
@State private var isPlaying = false

    //les variables s'han de declarar com a privades si fem servir estats
    
    var body: some View {
        
        Button(action: {
        
            self.isPlaying.toggle()
                
        })
        {
            Image(systemName: isPlaying ? "stop.circle.fill" : "play.circle.fill")
                .font(.system(size: 100))
                .foregroundColor(isPlaying ? .red : .green)
                .padding()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
