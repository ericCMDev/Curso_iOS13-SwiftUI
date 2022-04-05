//
//  ContentView.swift
//  TransitionsApp
//
//  Created by Eric Cabestany Mena on 5/4/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showTranslation = false
    
    var body: some View {
        VStack{
            Rectangle()
                .frame(width: 250, height: 250)
                .foregroundColor(.purple)
                .overlay(
                Text("Car")
                    .font(.system(.largeTitle,design: .rounded))
                    .bold()
                    .foregroundColor(.white)
                )
                
            if(showTranslation){
                Rectangle()
                    .frame(width: 250, height: 250)
                    .foregroundColor(.orange)
                    .overlay(
                    Text("Coche")
                        .font(.system(.largeTitle,design: .rounded))
                        .bold()
                        .foregroundColor(.white)
                    )
                    //.transition(AnyTransition.scale(scale: 0, anchor: .bottom).combined(with: .offset(x: -700, y: 0))) //posant el codi directament
                    .transition(.offsetScaledOpacityOut) //fent servir una extensió de la classe AnyTransition
                
            }
            
        }.onTapGesture {
            withAnimation(Animation.spring())
            {
                self.showTranslation.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension AnyTransition {
    static var offsetScaledOpacityOut: AnyTransition {
            AnyTransition.offset(x: -700, y:0)
                .combined(with: .scale)
                .combined(with: opacity)
        }
        
    }

