//
//  LoadingView.swift
//  AnimsApp
//
//  Created by Eric Cabestany Mena on 3/4/22.
//

import SwiftUI

struct LoadingView: View {
    
    @State private var isLoading = false
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(Color(.systemGray6), lineWidth: 20)
                .frame(width: 150, height: 150)
            Circle()
                .trim(from: 0.0, to: 0.4)
                .stroke(Color.green, lineWidth: 10)
                .frame(width: 150, height: 150)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                .onAppear(){
                    withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false))
                    {
                        self.isLoading = true
                    }
                }
        }
        
        
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
