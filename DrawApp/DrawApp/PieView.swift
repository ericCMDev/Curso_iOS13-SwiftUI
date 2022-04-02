//
//  PieView.swift
//  DrawApp
//
//  Created by Eric Cabestany Mena on 2/4/22.
//

import SwiftUI

struct PieView: View {
    var body: some View {
        
        ZStack{
            //path superior azul
            Path(){ path in
                
                path.move(to: CGPoint(x: 200, y: 250))
                path.addArc(center: CGPoint(x: 200, y: 250),
                            radius: 160,
                            startAngle: Angle(degrees: 0),
                            endAngle: Angle(degrees: 200),
                            clockwise: true)
                //clockwise a true es antiHorari
                
            }
            .fill(Color(.systemBlue))
            
            //path rojo
            Path(){ path in
                
                path.move(to: CGPoint(x: 200, y: 250))
                path.addArc(center: CGPoint(x: 200, y: 250),
                            radius: 160,
                            startAngle: Angle(degrees: 200),
                            endAngle: Angle(degrees: 160),
                            clockwise: true)
                //clockwise a true es antiHorari
                
            }
            .fill(Color(.systemRed))
            
            //path verd i text
            Path(){ path in
                
                path.move(to: CGPoint(x: 200, y: 250))
                path.addArc(center: CGPoint(x: 200, y: 250),
                            radius: 160,
                            startAngle: Angle(degrees: 160),
                            endAngle: Angle(degrees: 110),
                            clockwise: true)
                //clockwise a true es antiHorari
                
            }
            .fill(Color(.systemMint))
            .offset(x: -30, y: 30)
            
            Path(){ path in
                
                path.move(to: CGPoint(x: 200, y: 250))
                path.addArc(center: CGPoint(x: 200, y: 250),
                            radius: 160,
                            startAngle: Angle(degrees: 160),
                            endAngle: Angle(degrees: 110),
                            clockwise: true)
                //clockwise a true es antiHorari
                path.closeSubpath()
                
            }
            .stroke(Color.black, lineWidth: 3)
            .offset(x: -30, y: 30)
            .overlay(Text("11.1%")
                .font(.system(.title, design: .rounded))
                    .bold()
                    .offset(x:-100, y:-30)
            )
            
            //path taronja
            Path(){ path in
                
                path.move(to: CGPoint(x: 200, y: 250))
                path.addArc(center: CGPoint(x: 200, y: 250),
                            radius: 160,
                            startAngle: Angle(degrees: 110),
                            endAngle: Angle(degrees: 0),
                            clockwise: true)
                //clockwise a true es antiHorari
                
            }
            .fill(Color(.systemOrange))
        }
    }
}

struct PieView_Previews: PreviewProvider {
    static var previews: some View {
        PieView()
    }
}
