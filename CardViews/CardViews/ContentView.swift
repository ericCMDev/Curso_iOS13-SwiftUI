//
//  ContentView.swift
//  CardViews
//
//  Created by Eric Cabestany Mena on 22/2/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView( showsIndicators: false){
            
            VStack{
                Image("uoc-logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    //.padding(-10)
                    .frame(height: 80)
                
                Text("Eric Cabestany")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                Text("Enginyer informàtic")
                    .fontWeight(.light)
                    .foregroundColor(.secondary)
                Text("Universitat Oberta de Catalunya")
                    .font(.system(.footnote, design: .rounded))
                    .fontWeight(.black)
                    .foregroundColor(.secondary)
                
            }
            
            CardView(imageName: "github", authorName: "Eric Cabestany", courseTitle: "Curso de github de cero", originalPrice: "199.99€", discountPrice: "10.99€")
            
            CardView(imageName: "maths", authorName: "Eric Cabestany", courseTitle: "Curso de matemáticas", originalPrice: "199.99€", discountPrice: "9.99€")
            
            CardView(imageName: "unity", authorName: "Eric Cabestany", courseTitle: "Curso de unity", originalPrice: "199.99€", discountPrice: "12.99€")
            
            CardView(imageName: "unreal", authorName: "Eric Cabestany", courseTitle: "Curso de unreal", originalPrice: "199.99€", discountPrice: "15.99€")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
