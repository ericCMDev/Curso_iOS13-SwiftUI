//
//  CardView.swift
//  P2-Tinder
//
//  Created by Eric Cabestany Mena on 10/8/22.
//

import SwiftUI

struct CardView: View, Identifiable {
    
    let id = UUID()
    let course: Course
    
    var body: some View {
        
        Image(course.image)
            .resizable()
            .scaledToFill()
            .frame(minWidth: 0, maxWidth: .infinity)
            .cornerRadius(20)
            .padding()
            .overlay(
                VStack{
                    Text(course.name)
                        .font(.system(.title, design: .rounded))
                        .bold()
                        .padding(.horizontal, 20)
                        .padding(.vertical, 20)
                        .background(.white)
                        .cornerRadius(20)
                }.padding([.top, .horizontal], 50), alignment: .top
            )
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(course: courses[0])
    }
}

