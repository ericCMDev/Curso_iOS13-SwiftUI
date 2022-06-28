//
//  SettingsView.swift
//  Forms
//
//  Created by Eric Cabestany Mena on 27/6/22.
//

import SwiftUI

struct SettingsView: View {
    private var sortingMethod = ["Alfabéticamente", "Los favoritos primero", "Los comprados primero"]
    @State private var selectedSortingMethod = 0
    @State private var showPurchasedOnly = false
    @State private var coursePrice = 5{
        didSet{
            if coursePrice > 5 {
                coursePrice = 5
            }
            if coursePrice < 1 {
                coursePrice = 1
            }
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Ordenar los cursos")) {
                    Picker(selection: $selectedSortingMethod, label: Text("Ordenación"))
                    {
                        ForEach(0..<sortingMethod.count, id: \.self) {
                            Text(self.sortingMethod[$0])
                        }
         
                    }
                }
                Section(header: Text("Filtrar los cursos")) {
                    Toggle(isOn: $showPurchasedOnly ) {
                        Text("Mostrar sólo comprados")
                    }
                    Stepper( onIncrement:{
                        self.coursePrice += 1
                    }, onDecrement: {
                        self.coursePrice -= 1
                    }) {
                        Text("Mostrar \(String(repeating: "€", count: coursePrice)) o menos")
                    }

                }
                
            }
            .navigationBarTitle("Configuración")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
