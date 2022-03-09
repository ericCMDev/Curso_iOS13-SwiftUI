//
//  ClickView.swift
//  StateAndBindingApp
//
//  Created by Eric Cabestany Mena on 9/3/22.
//

import SwiftUI

struct ClickView: View {

    @State private var counter = 0
    
    var body: some View {
        
        VStack {
            
            CounterView(numClicks: )
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
    
    var body: some View {
        Button(action: {
        
            self.numClicks+=1
                
        }){
               Circle()
                .frame(width: 150, height: 150)
                .foregroundColor(.purple)
                .overlay(Text("\(numClicks)")
                .font(.system(size:80, weight:.bold, design: .rounded))
                .foregroundColor(.white)
                         
                )
            
        }
    }
}
