//
//  Course.swift
//  P2-Tinder
//
//  Created by Eric Cabestany Mena on 10/8/22.
//

import Foundation

struct Course {
    
    var name: String
    var image: String
}


#if DEBUG
var courses: [Course] = [

    Course(name: "Matemàtiques", image: "maths"),
    Course(name: "Curs Unity", image: "unity"),
    Course(name: "Curs Unreal", image: "unreal"),
    Course(name: "Curs Github", image: "github"),
    Course(name: "Carrera UOC", image: "uoc-logo")
    

]

#endif
