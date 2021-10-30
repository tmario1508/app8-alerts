//
//  ViewController.swift
//  App8-Alertas
//
//  Created by MTWDM301-2021 on 29/10/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onAlerta1(_ sender: Any) {
        //MARK: Crear una alerta
        let alerta = UIAlertController(title: "Alerta uno", message: "Este es un mensaje", preferredStyle: .alert)
        //MARK: Crear accion para la alerta
        alerta.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: {
            (UIAlertAction) in print("Se le ha dado en el boton aceptar")
        }))
        
        //MARK: Presentar alerta
        present(alerta, animated: true, completion: nil)
    }
    
    @IBAction func onAlerta2(_ sender: Any) {
        //MARK: Crear una alerta
        let alerta = UIAlertController(title: "Alerta dos", message: "Este es un mensaje", preferredStyle: .alert)
        
        //MARK: Crear accion para la alerta
        alerta.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: {
            (UIAlertAction) in self.lblInfo.text = "Se le ha dado clic en aceptar"
        }))
        alerta.addAction(UIAlertAction(title: "Cancelar", style: .destructive, handler: {
            (UIAlertAction) in self.lblInfo.text = "Se le ha dado en el boton cancelar"
        }))
        
        //MARK: Presentar alerta
        present(alerta, animated: true, completion: nil)
    }
    
    
    @IBAction func onAlerta3(_ sender: Any) {
        //MARK: Crear una alerta
        let alerta = UIAlertController(title: "Alerta uno", message: "Este es un mensaje", preferredStyle: .alert)
        alerta.addTextField{ (UITextField) in
            UITextField.placeholder = "Escribe"
            UITextField.textColor = UIColor.blue
            
        }
        
        //MARK: Crear acciones para la alerta
        alerta.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: { (UIAlertAction) in
            self.lblInfo.text = "Aceptar - \(alerta.textFields![0].text!)"
            
        }))
        alerta.addAction(UIAlertAction(title: "Cancelar", style: .destructive, handler: {
            (UIAlertAction) in self.lblInfo.text = "Se le ha dado en el boton cancelar"
        }))
        
        //MARK: Presentar alerta
        present(alerta, animated: true, completion: nil)
    }
    
    
    @IBAction func onAlerta4(_ sender: Any) {
        //MARK: Crear una alerta
        let alerta = UIAlertController(title: "Action sheet", message: "Selecciona un item", preferredStyle: .actionSheet)
        
        //MARK: Crear acciones para la alerta
        alerta.addAction(UIAlertAction(title: "Opcion 1", style: .default, handler: {
            (UIAlertAction) in self.lblInfo.text = "Se ha seleccionado la opcion 1"
        }))
        alerta.addAction(UIAlertAction(title: "Opcion 2", style: .default, handler: {
            (UIAlertAction) in self.lblInfo.text = "Se ha seleccionado la opcion 2"
        }))
        alerta.addAction(UIAlertAction(title: "Opcion 3", style: .destructive, handler: {
            (UIAlertAction) in self.lblInfo.text = "Se ha seleccionado la opcion 3"
        }))
        
        
        let presentationPopover = alerta.popoverPresentationController
        
        if presentationPopover != nil {
            presentationPopover?.sourceView = self.view
            presentationPopover?.permittedArrowDirections = .up
        }
        
        present(alerta, animated: true, completion: nil)
    
    }
    
    
    @IBOutlet weak var lblInfo: UILabel!
}

