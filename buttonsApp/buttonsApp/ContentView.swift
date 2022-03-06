//
//  ContentView.swift
//  buttonsApp
//
//  Created by Eric Cabestany Mena on 1/3/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       
        VStack {
            
            /*Button (action: {
                //Què farà el botó
                print("Botón hola pulsado")
            }) {
                //Com es veurà el botó
                Text("Hola Mundo")
                    .font(.system(.title))
                    .fontWeight(.bold)
                    
                
                    .padding()
                    .background(Color.green)
                    .foregroundColor(Color.white)
                    .cornerRadius(50)
                
                    .padding(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(Color.green, lineWidth: 5)
                            
                    )
                
                
                    
                    
        }*/
           
           
            
            Button(action: {
                
                print("Editar pulsado")
                
            }){
                HStack{
                    Image(systemName: "square.and.pencil")
                    Text("Editar")
                        .fontWeight(.bold)
                    
                }
               
                    
            }
            .buttonStyle(BasicButtonStyle())
            
            
            Button(action: {
                
                print("Eliminar pulsado")
                
            }){
                HStack{
                    Image(systemName: "trash")
                    Text("Eliminar")
                        .fontWeight(.bold)
                    
                }
                
                    
            }.buttonStyle(BasicButtonStyle())
            
            
            Button(action: {
                
                print("Compartir pulsado")
                
            }){
                HStack{
                    Image(systemName: "square.and.arrow.up")
                    Text("Compartir")
                        .fontWeight(.bold)
                    
                }
                
                    
            }.buttonStyle(BasicButtonStyle())
            
            Button(action: {
                
                print("Eliminar pulsado")
                
            }){
                HStack{
                    Image(systemName: "trash")
                    
                }
                
                    
            }.buttonStyle(RotateButtonStyle())
            
            
        }


    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BasicButtonStyle: ButtonStyle{
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        .frame(minWidth:0, maxWidth: .infinity)
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [Color("Dark Ocean 1"), Color("Dark Ocean 2")]), startPoint: .leading, endPoint: .trailing))
        .font(.title)
        .foregroundColor(Color.white)
        .cornerRadius(50)
        .shadow(color: .blue, radius: 20, x: 5, y: 3)
        .padding(.horizontal, 15)
        .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
        
        
        
    }
}
    
struct RotateButtonStyle: ButtonStyle{
        
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        .frame(minWidth:0, maxWidth: 80)
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .leading, endPoint: .trailing))
        .font(.title)
        .foregroundColor(Color.white)
        .cornerRadius(50)
        .shadow(color: .blue, radius: 20, x: 5, y: 3)
        .padding(.horizontal, 15)
        .rotationEffect(configuration.isPressed ? Angle(degrees: 360) : Angle(degrees: 0))
        
        
    }
    
    
}
