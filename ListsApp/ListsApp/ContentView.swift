//
//  ContentView.swift
//  ListsApp
//
//  Created by Eric Cabestany Mena on 7/4/22.
//

import SwiftUI

struct ContentView: View {
    
    var courseNames = [
        "Curso 1",
        "Curso 2",
        "Curso 3",
        "Curso 4"
    ]
    
    var courseImages = ["maths", "unity", "unreal", "uoc-logo"]
    
    var body: some View {
        
        
        List(courseNames.indices, id: \.self){ index  in
            HStack{
                
                Image(self.courseImages[index])
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipped()
                    .cornerRadius(30)
                Text(self.courseNames[index])
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
