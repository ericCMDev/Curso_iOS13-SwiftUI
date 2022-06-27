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
                    Text("filtres")
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
