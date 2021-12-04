//
//  Utilidades.swift
//  App10-SQLite
//
//  Created by MTWDM301-2021 on 12/11/21.
//

import Foundation

import UIKit

public enum tipoMsg {
    case Alert,Sheet
}

class Utilidades{
    var controlador : UIViewController?
    init(_controlador : UIViewController) {
        controlador = _controlador
    }
    
    func Mensaje(titulo: String, mensaje: String, tipo: tipoMsg) {
        let estiloAlerta = (tipo.hashValue == tipoMsg.Alert.hashValue) ? UIAlertController.Style.alert : UIAlertController.Style.actionSheet
        
        let alerta = UIAlertController(title: titulo, message: mensaje, preferredStyle: estiloAlerta)
        
        alerta.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
        
        if tipo.hashValue == tipoMsg.Sheet.hashValue {
            alerta.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
            
        }
        
        controlador?.present(alerta, animated: true, completion: nil)
    }
}
