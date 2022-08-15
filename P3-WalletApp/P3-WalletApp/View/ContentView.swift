//
//  ContentView.swift
//  P3-WalletApp
//
//  Created by Eric Cabestany Mena on 11/8/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var cards: [Card] = tempCards
    
    @State var cardPresented = false
    
    @State var cardPresed =  false
    
    @State var cardSelected : Card?
    
    @GestureState private var dragState = DragState.none
    
    private let offset: CGFloat = 75.0
    
    
    private func offset(for card: Card) -> CGSize {
        guard let idx = index(for: card)
        else {
            return CGSize() //retornarà (0,0)
        }
        
        if cardPresed {
            guard let cardSelected = self.cardSelected,
                  let cardSelectedIdx = cards.firstIndex(where: { $0.id == cardSelected.id})
            else {
                return CGSize()
            }
            if cardSelectedIdx <= idx {
                return CGSize()
            } else {
                return CGSize(width: 0, height: 3000)
            }
        }
        
        var pressedOffset = CGSize.zero
        var dragOffset : CGFloat = 0
        
        if let dragIdx = dragState.idx, dragIdx == idx {
            pressedOffset.height = dragState.isPressing ? -20 : 0
            switch dragState.translation.width {
            case let width where width < -15:
                pressedOffset.width = -25
            case let width where width > 15:
                pressedOffset.width = 25
            default:
                break
            }
            
            dragOffset = dragState.translation.height
        }
        
        
        return CGSize(width: 0 + pressedOffset.width,
                      height: -offset * CGFloat(idx) + pressedOffset.height + dragOffset)
        
    }
    
    private func zIndex(for card: Card) -> Double {
        guard let idx =  index(for: card) else {
            return 0.0
        }
        
        let defaultIndex = -Double(idx)
        
        if let dragIdx = dragState.idx, dragIdx == idx {
            return defaultIndex + Double(dragState.translation.height / offset)
        }
        
        return defaultIndex
    }
    
    private func animation(for card: Card) -> Animation {
        
        var delay = 0.0
        
        if let idx = index(for: card) {
            delay = Double(cards.count - idx) * 0.2
        }
        
        return Animation.spring(response: 0.2, dampingFraction: 1, blendDuration: 0.2).delay(delay)
    }
    
    private func index(for card: Card) -> Int? {
        guard let idx = cards.firstIndex(where: {$0.id == card.id}) else {
            return nil
        }
        return idx
    }
    
    private func orderCards(for card: Card, dragOffset: CGSize) {
        guard let oldIdx = index(for: card) else {
            return
        }
        
        var newIdx = oldIdx - Int(dragOffset.height / offset)
        
        if (newIdx > cards.count) {
            newIdx = cards.count - 1
        }
        if (newIdx < cards.count) {
            newIdx = 0
        }
        
        let removedCard = cards.remove(at: oldIdx)
        cards.insert(removedCard, at: newIdx)
    }
    
    var body: some View {
        VStack{
            TopBar()
                Spacer()
            ZStack{
                    if cardPresented {
                    ForEach(cards) { c in
                        CardView(card: c)
                            .offset(self.offset(for: c))
                            .animation(.default)
                            .padding(.horizontal, 30)
                            .zIndex(self.zIndex(for: c))
                            .shadow(color: .gray, radius: 1.5, x: 1.0, y: 1.0)
                            .transition(AnyTransition.slide.combined(with: .move(edge: .leading)).combined(with: .opacity))
                            .animation(self.animation(for: c))
                            .gesture(TapGesture()
                                .onEnded({ _ in
                                    withAnimation {
                                        self.cardPresed.toggle()
                                        self.cardSelected = self.cardPresed ? c : nil
                                    }
                                })
                                .exclusively(before: LongPressGesture(minimumDuration: 0.1)
                                //Només s'executa després d'una pulsació llarga
                                             
                                    .sequenced(before: DragGesture())
                                    .updating(self.$dragState, body: { (value, state, Transaction) in
                                        switch value {
                                        case .first(true):
                                            state = .pressing(idx: self.index(for: c))
                                        case .second(true, let drag):
                                            state = .dragging(idx: self.index(for: c), translation: drag?.translation ?? .zero)
                                        default:
                                            break
                                        }
                                    })
                                        .onEnded({ (value) in
                                            guard case .second(true, let drag?) = value else {
                                                return
                                            }
                                            self.orderCards(for: c, dragOffset: drag.translation)
                                        })
                                
                                                
                                )
                            )
                            
                    }
                }
            }.onAppear {
                self.cardPresented.toggle()
            }
            if cardPresed {
                TransactionHistoryView()
                    .padding(.top, 20)
                    .transition(.move(edge: .bottom))
                    .animation(.linear(duration: 0.2).delay(0.1))
            }
            Spacer()
        }
    }
}

struct CardView: View {
     
    var card: Card
    
    var body: some View {
        Image(card.image)
            .resizable()
            .scaledToFit()
            .overlay(
                VStack(alignment: .leading){
                    Text(card.number)
                        .bold()
                    Text(card.clientName)
                        .bold()
                    HStack{
                        Text("Vàlida fins:")
                            .font(.caption2)
                        Text(card.expirationDate)
                            .font(.caption)
                    }
                }.foregroundColor(.white)
                .padding(.leading, 75)
                .padding(.bottom, 45)
                .shadow(color: .black, radius: 1.5, x: 0.0, y: 1.0)
                ,alignment: .bottomLeading
            )
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            ContentView()
           /* TopBar().previewLayout(.sizeThatFits)
            ForEach(tempCards) { c in
                CardView(card: c).previewLayout(.sizeThatFits)
           
            }*/
           
        }
        
    }
}

struct TopBar:  View {
    var body: some View {
        HStack{
            Text("Wallet")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.heavy)
            Spacer()
            Image(systemName: "plus.circle")
                .font(.system(.largeTitle))
            
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 30)
    }
}
