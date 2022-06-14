//
//  DetailView.swift
//  navigationApp
//
//  Created by Eric Cabestany Mena on 5/6/22.
//

import SwiftUI

struct DetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var showAlert = false
    
    var course: Course
    var body: some View {
        ScrollView {
            VStack {
                Image(course.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    
                Text(course.name)
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.black)
                    .multilineTextAlignment(.center)
                    .frame(width: 300)
                
                Spacer()
            }
        }//.navigationBarTitleDisplayMode(.inline)
        .edgesIgnoringSafeArea(.top)
        .overlay(
            HStack {
                
                VStack {
                    Button(action:{
                        
                        self.showAlert.toggle()
                        
                    }, label: {
                        Image(systemName: "chevron.down.circle")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    })
                    .padding(.trailing, 320)
                    .padding(.top, 20)
                    Spacer()
                }
                
            }
        
        )
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Cerrar pestaña"),
                  message: Text("¿Seguro que quieres cerrar la pestaña?"),
                  primaryButton: .default(Text("Si"), action: {self.presentationMode.wrappedValue.dismiss()}),
                  secondaryButton: .cancel(Text("No")))
        }
        /*    .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading:
                    Button(action: {
    
                    self.presentationMode.wrappedValue.dismiss()
                    
                    }, label: {
                        Image(systemName: "arrow.left.circle.fill")
                            .font(.title)
                            .foregroundColor(.white)
                    })
                ) */
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(course: Course(name: "Carrera d'enginyeria informàtica", image: "unreal"))
    }
}
