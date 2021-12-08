//
//  ModeloUsuario.swift
//  Proyecto1
//
//  Created by MTWDM301-2021 on 06/12/21.
//

import Foundation

var listUsuarios : [EntidadUsuario] = []

class EntidadUsuario {
    init(id: String, user:String, pass: String) {
        self.id = id
        self.user =  user
        self.pass =  pass
    }
    var id : String = ""
    var user : String = ""
    var pass : String = ""
}
