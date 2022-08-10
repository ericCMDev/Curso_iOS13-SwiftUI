//
//  Course.swift
//  Project1-ExpandableBottomSheet
//
//  Created by Eric Cabestany Mena on 7/8/22.
//

import Foundation
import SwiftUI


struct Course: Identifiable {
    var id : UUID = UUID()
    var name: String
    var description: String
    var image: String
    var type: String
    var priceLevel: Int
    var visited: Bool = false
    
    init(name: String, description: String, image: String, type: String, priceLevel: Int){
        self.name = name
        self.description = description
        self.image = image
        self.type = type
        self.priceLevel = priceLevel
        self.visited = false
    }
    
    init(){
        self.init(name: "", description: "", image: "", type: "", priceLevel: 0)
    }
    
}

#if DEBUG //Per fer testing
var courses: [Course] = [
    Course(name: "Curso de Matemáticas",
           description: """
            Conoce toda la estadística descriptiva de la mano de Juan Gabriel Gomila y María Santos. Asienta las bases para convertirte en el Data Scientist del futuro con todo el contenido del curso. En particular verás los mismos contenidos que explicamos en primero de carrera a matemáticos, ingenieros o informáticos como por ejemplo:
            Logística e instalación de R y RStudio y de Anaconda Navigator para Python
            Cómo usar R y Python como si fuese una calculadora científica (incluyendo un repaso de funciones, trigonometría y combinatoria)
            Introducción a la programación funcional con R desde cero (ideal para seguir tomando a posteriori cursos de análisis de datos).
            Uso de gráficos para representar datos estadísticos incluyendo plots de nubes de puntos, histogramas, diagramas circulares o diagramas de caja y bigotes entre otros. Además tendrás ejemplos tanto en R como con matplotlib de Python.
            Introducción a las técnicas de machine learning como por ejemplo la regresión lineal.
            Profundización en tipos de datos cualitativos, cuantitativos  y ordinales y el correcto análisis de cada uno de ellos.
            Introducción a la probabilidad, empezando desde lo más básico, pasando por variables aleatorias hasta llegar a tratar las distribuciones de probabilidad más conocidas (tanto discretas como continuas)
            Comprende los estadísticos más relevantes de una distribución, como por ejemplo la media, varianza así como sesgo y curtosis. Y aprende a calcularlos tanto con R como con Python.
            Repositorio Github con todo el material del curso para disponer de los mismos scripts que usamos en clase desde el minuto inicial.
            Una vez termines el curso podrás seguir con los mejores cursos de análisis de datos publicados por Juan Gabriel Gomila como los cursos de Machine Learning o Inteligencia Artificial con Python o RStudio o el Curso de Data Science con Tidyverse y RStudio. Todo el material del curso está enfocado en resolver los problemas de falta de base que presentan los estudiantes de esos cursos avanzados y poderlo hacer en un curso a parte te permitirá nivelar tus conocimientos y tomar los otros cursos con garantías de éxito.
            """,
           image: "maths",
           type: "Matemáticas",
           priceLevel: 4),
    Course(name: "Curso de Unity",
           description: "",
           image: "unity",
           type: "Games",
           priceLevel: 5),
    Course(name: "Curso de Juegos Unreal",
           description: "",
           image: "unreal",
           type: "Games",
           priceLevel: 3),
    Course(name: "Curso la UOC",
           description: "",
           image: "uoc-logo",
           type: "Educación",
           priceLevel: 5)
]
#endif
