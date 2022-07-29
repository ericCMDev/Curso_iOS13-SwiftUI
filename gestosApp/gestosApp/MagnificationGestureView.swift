//
//  MagnificationGestureView.swift
//  gestosApp
//
//  Created by Eric Cabestany Mena on 29/7/22.
//

import SwiftUI

struct MagnificationGestureView<T>: View where T: View{
    var content: () -> T
    @State var magnifyBy = 1.0
    
    
    var body: some View {
        content()
            .scaleEffect(magnifyBy)
            .gesture(
                MagnificationGesture()
                    .onChanged{ value in
                        self.magnifyBy = value
                        
                    }
            )
    }
}

struct MagnificationGestureView_Previews: PreviewProvider {
    static var previews: some View {
        MagnificationGestureView() {
            Circle()
                .font(.system(size: 10 ))
        }
    }
}
