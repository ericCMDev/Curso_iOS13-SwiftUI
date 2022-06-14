//
//  ContentView.swift
//  modals
//
//  Created by Eric Cabestany Mena on 14/6/22.
//

import SwiftUI

struct ContentView: View {
    
    //@State var showDetailView = false
    @State var selectedCourse: Course?
    
    
    
 
    var body: some View {
        NavigationView {
            List(CourseFactory.courses){ course  in
                
                    //separem l'element de la navigation link per amagar la fletxeta de cada element de la llista >
                    CourseRow(course: course)
                    .onTapGesture {
                        //self.showDetailView.toggle()
                        self.selectedCourse = course
                    }
                
            }
            .sheet(item: self.$selectedCourse){ course in
                
                    DetailView(course: course)
            }
            .navigationBarTitle("Cursos Online", displayMode: .automatic)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct CourseRow: View {
    var course: Course
    var body: some View {
        HStack{
            
            Image(course.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipped()
                .cornerRadius(30)
            Text(course.name)
                .frame(width: 300)
        }
    }
}

