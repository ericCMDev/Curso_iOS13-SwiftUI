//
//  ContentView.swift
//  P2-Tinder
//
//  Created by Eric Cabestany Mena on 10/8/22.
//

import SwiftUI

struct ContentView: View {
    
    private let threshold: CGFloat = 100
    
    @GestureState private var dragState = DragState.none
    
    @State private var lastCardIdx = 1
    
    @State var deck : [CardView] = {
      
        var cards = [CardView]()
        
        for idx in 0..<2 { //només mostrem la primera i la segona targeta, optimitzem recursos (si hi haguéssin 1000 targetes, no cal pintar-les totes, tenin la primera i la següent n'hi ha prou)
            cards.append(CardView(course: courses[idx]))
        }
        
        return cards
        
    }()
    
    @State private var removalTransition = AnyTransition.leadingBottomAtRemoval
    
    var body: some View {
        VStack{
            TopBarView()
            Spacer(minLength: 10)
            ZStack{
                ForEach(deck) { card in
                    card.zIndex(self.isTopCard(card: card) ? 1 : 0)
                        .overlay(
                            ZStack {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.black)
                                    .font(.system(size: 80))
                                    .opacity(self.isTopCard(card: card) && self.dragState.translation.width < -self.threshold ? 1 : 0)
                                Image(systemName: "heart.circle")
                                    .foregroundColor(.pink)
                                    .font(.system(size: 80))
                                    .opacity(self.isTopCard(card: card) && self.dragState.translation.width > self.threshold ? 1 : 0)
                            }
                        )
                    //aquí li assignem un 1 a la targeta de dalt i és la que es mostrarà (perquè es mostra la que té el índex més alt, per tant totes tindran 0 excepta la primera que té 1)
                        .offset(x: self.isTopCard(card: card) ? self.dragState.translation.width : 0,
                                y: self.isTopCard(card: card) ? self.dragState.translation.height : 0)
                        .scaleEffect(self.dragState.isDragging && self.isTopCard(card: card) ? 0.9 : 1.0)
                        .rotationEffect(Angle(degrees: Double(self.isTopCard(card: card) ? self.dragState.translation.width/10 : 0)))
                        .animation(.interpolatingSpring(stiffness: 200, damping: 100), value: self.dragState.isDragging)
                        .transition(self.removalTransition)
                        .gesture(LongPressGesture(minimumDuration: 0.01)
                            .sequenced(before: DragGesture())
                            .updating(self.$dragState, body: {(value, state, transaction) in
                                switch value {
                                case .first(true):
                                    state = .pressing
                                case .second(true, let drag):
                                    state = .dragging(translation: drag?.translation ?? .zero)
                                default:
                                    break
                                }
                            })
                                .onChanged{ (value) in
                                    guard case .second(true, let drag?) = value else {
                                        return
                                    }
                                    self.removalTransition = drag.translation.width > 0 ? .trailingBottomAtRemoval : .leadingBottomAtRemoval
                                }
                                .onEnded {(value) in
                                    guard case .second(true, let drag?) = value else {
                                        return
                                    }
                                    if drag.translation.width > self.threshold || drag.translation.width < -self.threshold {
                                        //TODO: marcar el curs com a X o cor
                                        self.updateDeck()
                                    }
                                    
                                }
                                 
                        )
                        
                }
            }
            BottomBarView()
                .opacity(self.dragState.isDragging ? 0.1 : 1.0)
                .animation(.linear, value: self.dragState.isDragging)
        }
    }
    
    private func isTopCard(card: CardView) -> Bool {
        guard let idx = deck.firstIndex(where: {$0.id == card.id}) else {
            return false
        }
        
        //si arribem aquí la targeta està al mazo (deck). Retornem la de index més petit que voldrà dir que serà la primera que mostrarem (per defecte s'ordena al revés, és a dir que es mostra com a primera targeta la que té el índex més alt (la que per nosaltres volem que sigui la última)
        return idx == 0
                                        
        
    }
    
    private func updateDeck() {
        deck.removeFirst()
        self.lastCardIdx += 1
        
        let newCourse = courses[self.lastCardIdx % courses.count]
        let newCardView = CardView(course: newCourse)
        
        deck.append(newCardView)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            TopBarView().previewLayout(.sizeThatFits)
            BottomBarView().previewLayout(.sizeThatFits)
        }
    }
}


struct TopBarView: View {
    var body: some View{
        HStack {
            Image(systemName: "line.horizontal.3")
                .font(.system(size: 25))
                .foregroundColor(.black)
            Spacer()
            Image(systemName: "book.fill")
                .font(.system(size: 35))
                .foregroundColor(.black)
            Spacer()
            Image(systemName: "archivebox.fill")
                .font(.system(size: 25))
                .foregroundColor(.black)
        }
        .padding(15)
    }
}


struct BottomBarView: View {
    var body: some View {
        HStack{
            Image(systemName: "xmark")
                .font(.system(size: 25))
            Spacer()
            
            Button {
                //TODO: comprar curso
            } label: {
                Text("Comprar el curs")
                    .bold()
                    .foregroundColor(.white)
                    .padding(.all, 20)
                    .background(Color.black)
                    .cornerRadius(12)
            }
            .padding(15)
            Spacer()
            Image(systemName: "heart")
                .font(.system(size: 25))
                .foregroundColor(.black)
            
            
        }.padding(15)
    }
    
}


