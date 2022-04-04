//
//  DotsLoadingView.swift
//  AnimsApp
//
//  Created by Eric Cabestany Mena on 4/4/22.
//

import SwiftUI

struct DotsLoadingViewc_: View {
    
    @State private var isLoading = false
    
    var body: some View {
        HStack{
            ForEach(0...5, id: \.self){ index in
                Circle()
                    .frame(width: 16, height: 16)
                    .foregroundColor(Color.green)
                    .scaleEffect(self.isLoading ? 0 : 1)
                    .onAppear(){
                        withAnimation(Animation.linear(duration: 0.5).repeatForever().delay(Double(index)/10))
                        {
                            self.isLoading.toggle()
                        }
                    }
                
            }
                
        }
    }
}


struct DotsLoadingViewc__Previews: PreviewProvider {
    static var previews: some View {
        DotsLoadingViewc_()
    }
}
