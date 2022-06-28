//
//  ContentView.swift
//  Forms
//
//  Created by Eric Cabestany Mena on 21/6/22.
//

import SwiftUI

struct ContentView: View {
    
    
    
    @State var courses = [
        Course(name: "Curso 1", image: "maths", type: "Matemáticas", priceLevel: 4, featured: true),
        Course(name: "Curso 2", image: "unity", type: "Games", priceLevel: 5, purchased: true),
        Course(name: "Curso 3", image: "unreal", type: "Games", priceLevel: 3, featured: true, purchased: true),
        Course(name: "Curso 4", image: "uoc-logo", type: "Educación", priceLevel: 5)
    ]
    
    @State private var selectedCourse: Course?
    @State private var showActionSheet = false
    @State private var showSettings = false
    @State private var favoritedText = "Marcar como favorito"
    
    var body: some View {
        NavigationView {
            List{
            ForEach(courses){ course  in
                    ZStack{
                        //separem l'element de la navigation link per amagar la fletxeta de cada element de la llista >
                        CourseRow(course: course)
                            .contextMenu {
                                Button(action:  {
                                    self.setPurchased(item: course)
                                }, label: {
                                    HStack{
                                        Text("Comprar")
                                        Image(systemName: "checkmark.circle")
                                    }
                                })
                                
                                Button(action:  {
                                    self.setFeatured(item: course)
                                }, label: {
                                    HStack{
                                        Text("Destacar")
                                        Image(systemName: "star.circle")
                                    }
                                })
                                
                                Button(action:  {
                                    self.deleteCourse(item: course)
                                }, label: {
                                    HStack{
                                        Text("Eliminar")
                                        Image(systemName: "trash")
                                        .foregroundColor(.red)
                                    }
                                })
                            }
                            .onTapGesture {
                                self.selectedCourse = course
                                self.showActionSheet.toggle()
                            }.actionSheet(isPresented: $showActionSheet) {
                                ActionSheet(title: Text("Indica tu acción a realizar"),
                                            message: nil,
                                            buttons: [.default(Text("Marcar como favorito"),
                                                        action: {
                                                            if let selectedCourse = self.selectedCourse {
                                                            self.setFeatured(item: selectedCourse)
                                                            }
                                                    
                                                        }),
                                                      .destructive(Text("Eliminar curso"), action: {
                                                          if let selectedCourse = self.selectedCourse {
                                                              self.deleteCourse(item: selectedCourse)
                                                          }
                                                      }),
                                                      .cancel()
                                                    
                                            ])
                            }
                      /*  NavigationLink(destination: DetailView(course: course)) {
                            EmptyView()
                        }
                       */
                    }
            }.onDelete{ (indexSet) in self.courses.remove(atOffsets: indexSet)
                
                }
        }
        .navigationBarTitle("Cursos Online", displayMode: .automatic)
        .navigationBarItems(trailing:
            Button(action: {
                self.showSettings.toggle()
            }, label: {
                Image(systemName: "gear")
                    .font(.title)
                    .tint(.gray)
            })
            )
            .sheet(isPresented: $showSettings){
                SettingsView()
            }
        }
        
}
    
    private func setFeatured(item course: Course){
        if let idx = self.courses.firstIndex(where: {$0.id == course.id
        }) {
            self.courses[idx].featured.toggle()
        }
    }
    
    private func setPurchased(item course: Course){
        if let idx = self.courses.firstIndex(where: {$0.id == course.id
        }) {
            self.courses[idx].purchased.toggle()
        }
    }
    
    private func deleteCourse(item course: Course){
        if let idx = self.courses.firstIndex(where: {$0.id == course.id
        }) {
            self.courses.remove(at: idx)
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
                .clipShape(Circle())
                .padding(.trailing, 10)
            VStack(alignment:.leading) {
                HStack {
                    Text(course.name)
                        .font(.system(.body, design: .rounded))
                        .bold()
                    Text(String(repeating: "€", count: course.priceLevel))
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Text(course.type)
                    .bold()
                    .foregroundColor(.gray)
            }
            Spacer().layoutPriority(-10)
            
            if(course.featured)
            {
                Image(systemName: "star.circle.fill")
                    .foregroundColor(.yellow)
                
            }
            if(course.purchased)
            {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
            }
            
            
        }
    }
}
