//
//  ProgressView.swift
//  AnimsApp
//
//  Created by Eric Cabestany Mena on 4/4/22.
//

import SwiftUI

struct ProgressView: View {
    
    @State private var progress: CGFloat = 0.0
    
    var body: some View {
        ZStack{
        Text("\(Int(progress*100)) %")
                .font(.system(.title, design: .rounded))
                .bold()
            Circle()
                .stroke(Color(.systemGray4), lineWidth: 15)
                .frame(width: 150, height: 150)
            Circle()
                .trim(from: 0, to: progress)
                .stroke(Color.green, lineWidth: 15)
                .frame(width: 150, height: 150)
                .rotationEffect(Angle(degrees: -90))
            
            
        }.onAppear(){
            
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                self.progress += 0.01
                if self.progress >= 1.0{
                    timer.invalidate()
                }
                
            
            }
        }
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView()
    }
}
