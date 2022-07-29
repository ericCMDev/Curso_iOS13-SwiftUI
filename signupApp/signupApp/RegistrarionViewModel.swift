//
//  RegistrarionViewModel.swift
//  signupApp
//
//  Created by Eric Cabestany Mena on 16/7/22.
//

import Foundation
import Combine //ens serveix per actuar com a publisher - subscriber per anar controlant els canvis d'un per notificar a l'altre https://developer.apple.com/documentation/combine/

class RegistrationViewModel: ObservableObject {
    
    //El protocol ObservableObject és obligatori per poder declarar variables @Published dins la classe
    //Ens serveix per controlar els canvis de variables a mida que l'usuari modifica el seu valor
    //En aquest cas en serviran per poder validar que el formulari està correctament omplert
    
    
    //Dades entrades per l'usuari
    @Published var username = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    
    
    //validació de les dades entrades
    @Published var usernameLengthValid = false
    @Published var passwordLengthValid = false
    @Published var passwordCapitalLetter = false
    @Published var passwordMatch = false
    
    
    private var cancellableObjects: Set<AnyCancellable> = [] //serveix per alliberar memòria (netegem referències dels publicadors quan no els necessitem)
    
    
    init() {
        //aquí connectem la variable username amb la usernameLengthValid per validar la llargada de l'usuari dinàmicament a mida que va escrivint en el teclat del telf.
        $username
            .receive(on: RunLoop.main) //rebem els canvis en el fil principal d'execució (al ser quan l'usuari pica caràcters al formulari és el main)
            .map{ username in //map serveix per fer la transformació (en aquest cas per agafem el valor de username i retornem un boleà
                return username.count >= 6 //controlem els canvis que fa l'usuari afegint caràcters i retornem valor true/false segons logitud de caràcters
                
            }
            .assign(to: \.usernameLengthValid, on: self) //assignem el resultat del valor boleà anterior a la nostre variable de validació de logitud de l'usuari
            .store(in: &cancellableObjects)
        $password
            .receive(on: RunLoop.main)
            .map{ password in
                return password.count >= 8
            }
            .assign(to: \.passwordLengthValid, on: self)
            .store(in: &cancellableObjects)
        $password
            .receive(on: RunLoop.main)
            .map{
                password in
                let pattern = "[A-Z]"
                if let _ = password.range(of: pattern, options: .regularExpression){
                    return true
                } else {
                    return false
                }
            }
            .assign(to: \.passwordCapitalLetter, on: self)
            .store(in: &cancellableObjects)
       
        Publishers.CombineLatest($password, $confirmPassword)
            .receive(on: RunLoop.main)
            .map{ (password, confirmPassword) in
                
                return !password.isEmpty && (password == confirmPassword)
                
            }
            .assign(to: \.passwordMatch, on: self)
            .store(in: &cancellableObjects)
        
    }
    
}
