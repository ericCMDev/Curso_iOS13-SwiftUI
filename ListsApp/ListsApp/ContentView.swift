//
//  ContentView.swift
//  ListsApp
//
//  Created by Eric Cabestany Mena on 7/4/22.
//

import SwiftUI

struct ContentView: View {
    
    
    
    var courses = [
        Course(name: "Curso 1", image: "maths"),
        Course(name: "Curso 2", image: "unity"),
        Course(name: "Curso 3", image: "unreal"),
        Course(name: "Curso 4", image: "uoc-logo")
    ]
    
    var body: some View {
        List(courses){ course  in
            CourseRow(course: course)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Course: Identifiable {
    var id = UUID()
    var name: String
    var image: String
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
        }
    }
}
