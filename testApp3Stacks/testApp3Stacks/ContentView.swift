//
//  ContentView.swift
//  testApp3Stacks
//
//  Created by Eric Cabestany Mena on 16/2/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            HeaderView()
            
            HStack{
                PricingView(title: "Básico", subtitle: "Un curso incluido", price: "9.99€", textColor: .white, backgroundColor: .green)
                
                ZStack {
                    PricingView(title: "Carrera", subtitle: "Toda una carrera", price: "29.99€", textColor: .black, backgroundColor: Color(red:230/255, green:230/255, blue:230/255))
                    
                    Text("El mejor para empezar")
                        .font(.system(.caption, design: .rounded))
                        .foregroundColor(.white)
                        .fontWeight(.black)
                        .padding(8)
                        .background(Color(red:240/255, green:180/255, blue:50/255))
                        .cornerRadius(10)
                        .offset(x:0,y:-75)
                        
                }
                
                }.padding(.horizontal)
                 
            
            HStack{
                ZStack {
                    PricingView(title: "Definitivo", subtitle: "Todos los cursos online", price: "99.99€", textColor: .white, backgroundColor: .gray, icon: "lightbulb").padding(.horizontal)
                    
                    Text("Conviértete en un máster del universo")
                        .font(.system(.caption, design: .rounded))
                        .foregroundColor(.white)
                        .fontWeight(.black)
                        .padding(8)
                        .background(Color(red:240/255, green:180/255, blue:50/255))
                        .cornerRadius(10)
                        .offset(x:0,y:-83)
                        
                    
                }.padding(.horizontal)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HeaderView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 4){
            Text("Elige tu itinerario")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.black)
            Text("de aprendizaje")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.black)
            
        }
    }
}

struct PricingView: View {
    
    var title: String
    var subtitle: String
    var price: String
    var textColor: Color
    var backgroundColor: Color
    var icon: String?
    
    
    
    var body: some View {
        VStack{
            
            icon.map({
                Image(systemName:$0) //$0 és la primera variable que troba, en aquest cas "icon"
                .font(.title)
                .foregroundColor(.white)
                
            })
                
            
            Text(title)
                .font(.system(.title, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(textColor)
            Text(price)
                .font(.system(size: 28, weight: .heavy, design: .rounded))
                .foregroundColor(textColor)
            Text(subtitle)
                .font(.headline)
                .foregroundColor(textColor)
            
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
            .padding(31)
            .background(backgroundColor)
            .cornerRadius(10)
    }
}
