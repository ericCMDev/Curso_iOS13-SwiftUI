//
//  ContentView.swift
//  DrawApp
//
//  Created by Eric Cabestany Mena on 30/3/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Path(){ path in
            path.move(to: CGPoint(x: 30, y: 30))
            path.addLine(to: CGPoint(x: 230, y: 30))
            path.addLine(to: CGPoint(x: 230, y: 150))
            path.addLine(to: CGPoint(x: 30, y: 150))
            path.closeSubpath()
                
        }
        //.fill(Color.blue)
        .stroke(Color.green, lineWidth: 12)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
