//
//  ContentView.swift
//  testOne
//
//  Created by Eric Cabestany Mena on 15/2/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur et efficitur felis. Vestibulum aliquam felis eget enim commodo laoreet. Praesent quis consectetur eros. Praesent maximus vitae tellus vel consectetur. ")
            .fontWeight(.bold)
            .font(.system(.title))
            .foregroundColor(.black)
            .multilineTextAlignment(.center)
            .lineLimit(nil)
            .truncationMode(.tail)
            .lineSpacing(5)
            .padding()
//            .rotationEffect(.degrees(10), anchor: UnitPoint(x:0, y: 0))
            .rotation3DEffect(.degrees(50), axis: (x: 1, y:0, z: 0))
            .shadow(color: .gray, radius: 3, x: 4, y: 5)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
