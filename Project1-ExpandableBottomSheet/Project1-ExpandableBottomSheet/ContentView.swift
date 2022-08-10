//
//  ContentView.swift
//  Project1-ExpandableBottomSheet
//
//  Created by Eric Cabestany Mena on 7/8/22.
//

import SwiftUI

struct ContentView: View {
    @State private var showCourseDetail =  false
    @State private var selectedCourse : Course?
    
    var body: some View {
        ZStack {
            NavigationView{
                List{
                    ForEach(courses){ course in
                        BasicRow(course: course)
                            .onTapGesture {
                                self.showCourseDetail.toggle()
                                self.selectedCourse = course
                            }
                    }
                }
                .navigationTitle("Cursos")
            }
            .offset(y: self.showCourseDetail ? -150 : 0 )
            .animation(.easeIn(duration: 0.3), value: self.showCourseDetail)
            if showCourseDetail {
                BlanketView(color: .gray)
                    .opacity(0.3)
                    .onTapGesture {
                        self.showCourseDetail = false
                    }
                self.selectedCourse.map{   //el map és semblant al for
                    CourseDetailView(course: $0, isShown: $showCourseDetail)
                        .transition(.move(edge: .bottom))
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BasicRow: View {
    var course: Course
    
    var body: some View{
        HStack{
            Image(course.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .cornerRadius(10)
            Text(course.name)
        }
    }
}

struct BlanketView: View {
    var color: Color
    var body: some View{
        
        VStack {
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(color)
        .edgesIgnoringSafeArea(.all)
    }
}
