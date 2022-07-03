//
//  SettingsView.swift
//  Forms
//
//  Created by Eric Cabestany Mena on 27/6/22.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var settings: SettingsFactory
    
    @State private var selectedSortingMethod = SortingOrderType.alphabetical
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
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Ordenar los cursos")) {
                    Picker(selection: $selectedSortingMethod, label: Text("Ordenación"))
                    {
                        ForEach(SortingOrderType.allCases, id: \.self) { orderType in
                            Text(orderType.description)
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
            .navigationBarItems(leading:
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "chevron.down")
                        .font(.title)
                        
                }),
                trailing:
                Button(action: {
                    self.settings.order = self.selectedSortingMethod
                    self.settings.showPurchased = self.showPurchasedOnly
                    self.settings.price = self.coursePrice
                    dismiss()
                }, label: {
                    Image(systemName: "square.and.arrow.down")
                        .font(.title)
                        
                })
                )
            
        }
        .onAppear {
            self.selectedSortingMethod = self.settings.order
            self.showPurchasedOnly  = self.settings.showPurchased
            self.coursePrice = self.settings.price
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView().environmentObject(SettingsFactory())
    }
}
