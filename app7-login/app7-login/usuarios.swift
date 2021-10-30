//
//  usuarios.swift
//  app7-login
//
//  Created by MTWDM301-2021 on 22/10/21.
//

import Foundation

//MARK: Declaracion global
var lista : [EntidadUsuario] = []

class EntidadUsuario {
    
    init(usuario : String, pass : String) {
        self.usuario = usuario
        self.pass = pass
    }
    var usuario : String = ""
    var pass : String = ""
}
