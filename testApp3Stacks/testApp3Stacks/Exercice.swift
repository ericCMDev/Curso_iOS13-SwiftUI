//
//  Exercice.swift
//  testApp3Stacks
//
//  Created by Eric Cabestany on 18/2/22.
//

import SwiftUI

struct Exercice: View {
    var body: some View {
        VStack{
            HeaderView2()
            
            VStack{
                PricingView2(title: "Básico", subtitle: "Un curso incluido", price: "9.99€", textColor: .white, backgroundColor: .green, icon: "brain")
                
                ZStack {
                    PricingView2(title: "Carrera", subtitle: "Toda una carrera", price: "29.99€", textColor: .black, backgroundColor: Color(red:230/255, green:230/255, blue:230/255), icon: "graduationcap")
                    
                    Text("El mejor para empezar")
                        .font(.system(.caption, design: .rounded))
                        .foregroundColor(.white)
                        .fontWeight(.black)
                        .padding(8)
                        .background(Color(red:240/255, green:180/255, blue:50/255))
                        .cornerRadius(10)
                        .offset(x:0,y:-85)
                        
                }.offset(x:0,y:-85)
                
                }.padding(.horizontal)
                 
            
            HStack{
                ZStack {
                    PricingView2(title: "Definitivo", subtitle: "Todos los cursos online", price: "99.99€", textColor: .white, backgroundColor: .black, icon: "lightbulb").padding(.horizontal)
                    
                    Text("Conviértete en un máster del universo")
                        .font(.system(.caption, design: .rounded))
                        .foregroundColor(.white)
                        .fontWeight(.black)
                        .padding(8)
                        .background(Color(red:240/255, green:180/255, blue:50/255))
                        .cornerRadius(10)
                        .offset(x:0,y:-83)
                        
                    
                }.offset(x:0,y:-190)
            }.padding(.vertical)
            Spacer()
        }
       
        
    }
}

struct Exercice_Previews: PreviewProvider {
    static var previews: some View {
        Exercice()
    }
}

struct HeaderView2: View {
    var body: some View {
        
        HStack {
            VStack(alignment: .leading, spacing: 5){
                Text("Elige tu itinerario")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
                Text("de aprendizaje")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
                
            }
            Spacer()
        }
        .padding()
        
    }
}

struct PricingView2: View {
    
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
                .foregroundColor(textColor)
                
                
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
