//
//  LoadingBarView.swift
//  AnimsApp
//
//  Created by Eric Cabestany Mena on 4/4/22.
//

import SwiftUI

struct LoadingBarView: View {
    @State private var isLoading = false
    
    var body: some View {
        ZStack{
            Text("Cargando")
                .font(.system(.title, design: .rounded))
                .bold()
                .offset(x:0, y: -50)
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.systemGray5), lineWidth: 6)
                .frame(width: 300, height: 5)
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.green, lineWidth: 6)
                .frame(width: 50, height: 5)
                .offset(x:isLoading ? 125 : -125, y:0)
                .onAppear(){
                withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false))
                {
                    self.isLoading = true
                }
            }
        }
    }
}

struct LoadingBarView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingBarView()
    }
}
