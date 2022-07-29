//
//  ContentView.swift
//  signupApp
//
//  Created by Eric Cabestany Mena on 4/7/22.
//

import SwiftUI

struct ContentView: View {
    
    
    
    @ObservedObject private var registrationViewModel = RegistrationViewModel()
    
    var body: some View {
        VStack {
            
            Text("Crea una cuenta")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.bold)
                
            SingleFormView(fieldName: "Nombre de usuario", fieldValue: $registrationViewModel.username)
            ValidationFormView(iconName: registrationViewModel.usernameLengthValid ?  "checkmark.circle" : "xmark.circle",
                               iconColor: registrationViewModel.usernameLengthValid ? Color.green : Color.red,
                               formText: "Mínimo 6 carácteres",
                               conditionChecked: registrationViewModel.usernameLengthValid)
                .padding()
            SingleFormView(isProtected: true, fieldName: "Contraseña", fieldValue: $registrationViewModel.password)
            VStack {
                ValidationFormView(iconName: registrationViewModel.passwordLengthValid ?  "checkmark.circle" : "xmark.circle",
                                   iconColor: registrationViewModel.passwordLengthValid ? Color.green : Color.red,
                                   formText:"Mínimo 8 carácteres",
                                   conditionChecked: registrationViewModel.passwordLengthValid)
                ValidationFormView(iconName: registrationViewModel.passwordCapitalLetter ?  "checkmark.circle" : "xmark.circle",
                                   iconColor: registrationViewModel.passwordCapitalLetter ? Color.green : Color.red,
                                   formText:"Una mayúscula y una minúscula",
                                   conditionChecked: registrationViewModel.passwordCapitalLetter)
            }
            .padding()
            SingleFormView(isProtected: true, fieldName: "Confirmar contraseña", fieldValue: $registrationViewModel.confirmPassword)
            ValidationFormView(iconName: registrationViewModel.passwordMatch ?  "checkmark.circle" : "xmark.circle",
                               iconColor: registrationViewModel.passwordMatch ? Color.green : Color.red,
                               formText:"Las contraseñas deben coincidir",
                               conditionChecked: registrationViewModel.passwordMatch)
                .padding()
                .padding(.bottom, 10)
            Button {
                //TODO: acceder a la siguiente pantalla
            } label: {
                Text("Registrarse")
                    .font(.system(.headline, design: .rounded))
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                    .background(LinearGradient(gradient: Gradient(colors: [Color.green, Color.orange]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(50)
            }
            HStack {
                Text("¿Ya tienes una cuenta?")
                    .font(.system(.body, design: .rounded))
                    .bold()
                Button {
                    //TODO: pantalla de login
                } label: {
                    Text("Entrar ahora")
                        .font(.system(.headline, design: .rounded))
                        .foregroundColor(.green)
                        
                }

            }
            .padding(.top, 10)

            Spacer()
            }
        .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SingleFormView: View {
    
    var isProtected = false
    var fieldName = ""
    @Binding var fieldValue: String
     
    var body: some View {
        VStack {
            if isProtected {
                SecureField(fieldName, text: $fieldValue)
                    .font(.system(size:18, weight: .bold, design: .rounded))
                    .padding(.horizontal)
             
            } else {
                TextField(fieldName, text: $fieldValue)
                    .font(.system(size:18, weight: .bold, design: .rounded))
                    .padding(.horizontal)
            }
            Divider()
                .frame(height: 1)
                .background(Color.gray)
                .padding(.horizontal)
        }
    }
}

struct ValidationFormView: View {
    var iconName = "x.circle"
    var iconColor = Color(red: 0.9, green: 0.5, blue: 0.5)
    var formText = ""
    var conditionChecked = false
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .foregroundColor(iconColor)
            
            Text(formText)
                .font(.system(.body, design: .rounded))
                .foregroundColor(.secondary)
                .strikethrough(conditionChecked)
            Spacer()
        }
    }
}
