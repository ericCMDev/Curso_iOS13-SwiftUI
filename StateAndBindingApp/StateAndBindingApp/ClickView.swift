//
//  ClickView.swift
//  StateAndBindingApp
//
//  Created by Eric Cabestany Mena on 9/3/22.
//

import SwiftUI

struct ClickView: View {

    @State private var counterPurple = 0
    @State private var counterYellow = 0
    @State private var counterGreen = 0
    
    
    var body: some View {
        
        VStack {
            
            
                Circle()
                    .frame(width: 150, height: 150)
                    .foregroundColor(.red)
                    .overlay(Text("\(counterGreen+counterYellow+counterPurple)"))
                        .font(.system(size:80, weight:.bold, design: .rounded))
                        .foregroundColor(.black)
            
                    
            
               
            
            CounterView(numClicks: $counterPurple, buttonColor: .purple)
            CounterView(numClicks: $counterYellow, buttonColor: .yellow)
            CounterView(numClicks: $counterGreen, buttonColor: .green)
            
        }
        
        
        
    
    }
}

struct ClickView_Previews: PreviewProvider {
    static var previews: some View {
        ClickView()
    }
}



struct CounterView: View {
    
    @Binding var numClicks: Int
    
    var buttonColor: Color
    
    var body: some View {
        Button(action: {
            
            self.numClicks+=1
            
        }){
            Circle()
                .frame(width: 150, height: 150)
                .foregroundColor(buttonColor)
                .overlay(Text("\(numClicks)")
                    .font(.system(size:80, weight:.bold, design: .rounded))
                    .foregroundColor(.white)
                         
                )
            
        }
    }
}
