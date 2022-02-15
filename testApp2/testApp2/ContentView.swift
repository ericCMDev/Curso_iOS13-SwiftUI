//
//  ContentView.swift
//  testApp2
//
//  Created by Eric Cabestany Mena on 15/2/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image("books")
            .resizable()
            //.edgesIgnoringSafeArea(.vertical)
            //.scaledToFit()
            .aspectRatio(contentMode: .fill)
            .frame(width: 300)
            //.clipped()
            .clipShape(Capsule())
            .opacity(0.9)
            .overlay(
                Image(systemName: "heart.fill")
                    .font(.system(size: 150))
                    .foregroundColor(.red)
                    .opacity(0.5)
                    
                
            )
            .overlay(Text("MyApp")
                        .fontWeight(.bold)
                        .font(.system(.title, design: .rounded))
                        .opacity(0.8)
                        
            )
            
            
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
