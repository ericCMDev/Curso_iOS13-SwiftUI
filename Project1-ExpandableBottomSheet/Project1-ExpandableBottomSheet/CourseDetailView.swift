//
//  CourseDetalView.swift
//  Project1-ExpandableBottomSheet
//
//  Created by Eric Cabestany Mena on 7/8/22.
//

import SwiftUI

struct CourseDetailView: View {
    @GestureState private var dragState = DragState.none
    @State private var offset: CGFloat = 0
    @State private var cardState = CardState.half
    var course: Course
    @Binding var isShown: Bool
    
    
    var body: some View {
        GeometryReader{ geometry in //geomtryReader ens serveix per decidir dinàmicament la mida de la pantalla i no posar mides fixes al offset per exemple
                VStack{
                    Spacer()
                    HandleBar()
                    TitleBar(titleText: "Detalles del curso")
                    ScrollView(.vertical){
                        HeaderView(course: self.course) //a la que hem posat el geometry i és un closure hem de fer self.course
                        DescriptionView(icon: "dollarsign.circle.fill", content: "\(self.course.priceLevel)")
                            .padding(.top)
                        DescriptionView(icon: nil, content: self.course.description)
                    }
                    .disabled(self.cardState == .half || self.dragState.isDragging)
                    
                }
                .background(Color.white)
                .cornerRadius(8)
                .offset(y:geometry.size.height*0.3 + self.dragState.translation.height + self.offset) //així no ocupa tota la pantalla i ho fem dinàmicament segons porcentatge i així per altres dispositius és el mateix percentatge segons la mida de la seva pantalla
                .animation(.interpolatingSpring(stiffness: 200, damping: 50, initialVelocity: 10))
                .gesture(DragGesture()
                    .updating(self.$dragState){ (value, state, transaction) in
                        
                        state =  DragState.dragging(translation: value.translation)
                        
                    }
                    .onEnded({(value) in
                        switch self.cardState {
                        case .half:
                            //umbral superior, si se supera, transició a estat full
                            if value.translation.height < -0.25*geometry.size.height {
                                self.offset = -0.30*geometry.size.height
                                self.cardState = .full
                            }
                            //umbral inferior, si baixa molt, transició a ocultar la targeta
                            if value.translation.height > 0.25*geometry.size.height{
                                self.isShown = false
                            }
                            break
                        case .full:
                            //umbral pequeño, si se supera transició a estat half
                            if value.translation.height > 0.25*geometry.size.height {
                                self.offset = 0
                                self.cardState = .half
                            }
                            //umbral gran (arrosseguem més de la meitat cap avall de la pantalla, transició a ocultar targeta
                            if value.translation.height > 0.75*geometry.size.height {
                                self.isShown = false
                            }
                            break
                        }
                    })
                )
        }
        
        
    }
}
struct CourseDetalView_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetailView(course: courses[0], isShown: .constant(true))
            .background(Color.gray.opacity(0.3))
    }
}

struct HandleBar: View {
    var body: some View{
        Rectangle()
        .frame(width: 100, height: 5)
        .foregroundColor(Color(.systemGray4))
        .cornerRadius(8)
    }
}

struct TitleBar: View {
    var titleText: String
    var body: some View {
        Text(titleText)
            .font(.headline)
            .foregroundColor(.primary)
            .padding()
    }
}

struct HeaderView: View{
    var course: Course
    var body: some View{
        Image(course.image)
            .resizable()
            .scaledToFit()
            .overlay(
                HStack{
                    VStack(alignment: .leading){
                        Spacer()
                        Text(course.name)
                            .foregroundColor(.white)
                            .font(.system(.title, design: .rounded))
                            .bold()
                            .background(Color.mint)
                            .cornerRadius(8)
                        Text(course.type)
                            .font(.system(.subheadline, design: .rounded))
                            .foregroundColor(.white)
                            .padding(5)
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                    Spacer()
                }
                .padding()
            )
    }
}

struct DescriptionView: View {
    var icon: String?
    var content: String
    var body: some View {
        HStack {
            if icon != nil {
                Image(systemName: icon!)
                    .padding(.trailing, 10)
            }
            Text(content)
                .font(.system(.body, design: .rounded))
            Spacer()
        }.padding(.horizontal)
    }
}

enum CardState {
    case half
    case full
}
