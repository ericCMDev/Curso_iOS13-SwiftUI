//
//  DraggableView.swift
//  gestosApp
//
//  Created by Eric Cabestany Mena on 29/7/22.
//

import SwiftUI

struct DraggableView<Content>: View where Content: View { //on hi ha "Content" també es pot veure "T" --> serveix per indicar contingut genèric
    
    @GestureState private var dragState = DragState.none
    //anem a buscar els valors del enum d'abaix de tot
    
    @State private var position = CGSize.zero
    
    var content: () -> Content
    
    var body: some View {
             content()
             .opacity(dragState.isPressing ? 0.5 : 1.0)
             .offset(x: position.width + dragState.translation.width,
                     y: position.height + dragState.translation.height
             )
             .padding()
             .gesture(
                
                 LongPressGesture(minimumDuration: 0.5)
                     .sequenced(before: DragGesture())
                     .updating($dragState){ (value, state, transaction) in
                         switch value { //en aquest cas no hi ha break després de cada case perquè pot saltar d'un case a l'altre
                             case.first(true):
                                 state = .pressing
                             case.second(true, let drag):
                                 state = .dragging(translation: drag?.translation ?? .zero)
                             default:
                                 break
                         }
                     }
                     .onEnded { (value) in
                         guard case .second(true, let drag?) = value else {
                             return
                         }
                         self.position.height += drag.translation.height
                         self.position.width += drag.translation.width
                         
                     }
             )
    }
}

struct DraggableView_Previews: PreviewProvider {
    static var previews: some View {
        DraggableView(){
            
            VStack {
                Image(systemName: "shareplay")
                .font(.system(size: 80))
                .foregroundColor(.green)

            }
        }
    }
}

enum DragState {
    case none
    case pressing
    case dragging(translation: CGSize)
    
    var translation: CGSize {
        switch self {
        case .none, .pressing:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }
    
    var isPressing: Bool {
        switch self {
        case .pressing, .dragging:
            return true
        case .none:
            return false
        }
    
    }
    
}
