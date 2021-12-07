//
//  ModeloUsuario.swift
//  Proyecto1
//
//  Created by MTWDM301-2021 on 06/12/21.
//

import Foundation

var lista : [EntidadUsuario] = []

class EntidadUsuario {
    init(usuario:String, pass: String) {
        self.usuario =  usuario
        self.pass =  pass
    }
    
    var usuario : String = ""
    var pass : String = ""
}
