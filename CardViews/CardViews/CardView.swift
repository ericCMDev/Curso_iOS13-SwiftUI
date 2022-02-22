//
//  CardView.swift
//  CardViews
//
//  Created by Eric Cabestany Mena on 22/2/22.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        VStack {
            Image("github")
                .resizable()
                .aspectRatio(contentMode: .fit)
                
            
            HStack {
                VStack(alignment: .leading){
                    Text("Eric Cabestany")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Text("Curso de Github de cero".uppercased())
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .lineLimit(2)
                    HStack {
                        Text("10.99€")
                            .font(.subheadline)
                            .fontWeight(.bold)
                        .foregroundColor(.primary)
                        Text("199.99€")
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .strikethrough()
                        
                    }
                    
                }
                .layoutPriority(10)
                
                Spacer()
            }.padding()
        }
        .cornerRadius(12)
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color(red: 130/255, green: 130/255, blue: 130/255, opacity: 0.2), lineWidth: 2))
        .padding([.top, .horizontal]) //fem padding de la targeta amb un array (padding doble en aquest cas només en té de manera horitzontal i per dalt, però no a baix)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
