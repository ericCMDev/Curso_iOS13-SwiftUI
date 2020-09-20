//
//  ContentView.swift
//  02-imagesv2
//
//  Created by Eric Cabestany Mena on 20/09/2020.
//  Copyright © 2020 Eric Cabestany Mena. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image("newyork")
            .resizable()
//            .edgesIgnoringSafeArea(.vertical)
//            .scaledToFit()
            .aspectRatio(contentMode: .fill)
            .frame(width:300)
//            .clipped()
            .clipShape(Capsule())
            .opacity(0.9)
            .overlay(
               /* Image(systemName: "heart.fill")
                .font(.system(size: 60))
                .foregroundColor(.red)
                .opacity(0.5)
                */
               /* Text("Qué ganas de ir a Nueva York!")
                    .fontWeight(.bold)
                    .font(.system(.headline,
                        design: .rounded))
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(10)
                    .opacity(0.7), alignment: .bottom
                */
                Capsule()
                    .foregroundColor(.red)
                    .opacity(0.2)
                .overlay(
                    Text("Nueva York")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .frame(width: 250)
                        
                    
                )
        )
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
