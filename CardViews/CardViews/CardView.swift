//
//  CardView.swift
//  CardViews
//
//  Created by Eric Cabestany Mena on 22/2/22.
//

import SwiftUI

struct CardView: View {
    
    var imageName: String
    var authorName: String
    var courseTitle: String
    var originalPrice: String
    var discountPrice: String
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                
            
            HStack {
                VStack(alignment: .leading){
                    Text(authorName)
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Text(courseTitle.uppercased())
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .lineLimit(2)
                    HStack {
                        Text(discountPrice)
                            .font(.subheadline)
                            .fontWeight(.bold)
                        .foregroundColor(.primary)
                        Text(originalPrice)
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
        CardView(imageName: "github", authorName: "Eric Cabestany", courseTitle: "Curso de github de cero", originalPrice: "199.99€", discountPrice: "10.99€")
    }
}
