//
//  DetailView.swift
//  navigationApp
//
//  Created by Eric Cabestany Mena on 5/6/22.
//

import SwiftUI

struct DetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
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
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading:
                    Button(action: {
    
                    self.presentationMode.wrappedValue.dismiss()
                    
                    }, label: {
                        Image(systemName: "arrow.left.circle.fill")
                            .font(.title)
                            .foregroundColor(.white)
                    })
                )
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(course: Course(name: "Carrera d'enginyeria informàtica", image: "unreal", type: "Educación", priceLevel: 5))
    }
}
