//
//  ContentView.swift
//  gestosApp
//
//  Created by Eric Cabestany Mena on 17/7/22.
//

import SwiftUI

struct ContentView: View {
    @State private var pressed = false
    @GestureState private var hasbeenlongpressed =  false
    
    var body: some View {
       Image(systemName: "shareplay")
            .font(.system(size: 150))
            .foregroundColor(.green)
            .opacity(hasbeenlongpressed ? 0.5 : 1.0)
            .scaleEffect(pressed ? 2.0 : 1.0)
            .animation(Animation.easeIn, value: pressed)
            .padding()
            .gesture(
                //TapGesture()
                LongPressGesture(minimumDuration: 0.5)
                    .updating($hasbeenlongpressed) { (value, state, transaction) in
                        state = value
                        //value és l'estat actual i state és l'estat final
                    }
                    .onEnded{ _ in
                        self.pressed.toggle()
                    }
            )
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
