//
//  ContentView.swift
//  AnimsApp
//
//  Created by Eric Cabestany Mena on 3/4/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var buttonColorChanged = false
    @State private var iconColorChanged = false
    @State private var iconSizeChanged = false
    @State private var animationAmount = 1.0
    
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 180, height: 180)
                .foregroundColor(buttonColorChanged ? Color(.systemGray4) : .green)
                
                
            
            Image(systemName: "keyboard")
                .font(.system(size: 80))
                .foregroundColor(iconColorChanged ? .green : Color(.systemGray6))
                .scaleEffect(iconSizeChanged ? 1.0 : 0.5)
               
                                
                
        }
        //a iOS 15 s'ha de modificar ja que deixarà de funcionar o utilitzar withAnimation
        //.animation(.default)
        //.animation(.spring(response: 0.5, dampingFraction: 0.2, blendDuration: 0.5))
        
        .onTapGesture {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.2, blendDuration: 0.5))
            {
                self.buttonColorChanged.toggle()
                self.iconColorChanged.toggle()
            }
            
            self.iconSizeChanged.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
