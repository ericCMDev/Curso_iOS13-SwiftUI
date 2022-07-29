//
//  DragView.swift
//  gestosApp
//
//  Created by Eric Cabestany Mena on 24/7/22.
//

import SwiftUI

struct DragView: View {
    
    var body: some View {
        DraggableView(){
            Text("😼")
                .font(.system(size: 80))
        }
    }
}

struct DragView_Previews: PreviewProvider {
    static var previews: some View {
        DragView()
    }
}


