//
//  ViewController.swift
//  app4-ViewController
//
//  Created by MTWDM301-2021 on 01/10/21.
//

import UIKit

var dato: String = ""

class ViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Conexiones de los Outlet
    @IBOutlet weak var txtNombre: UITextField!
    
    @IBOutlet weak var eresEstudiante: UISwitch!
    
    @IBOutlet weak var lblNombre: UILabel!
    
    @IBAction func onVista(_ sender: Any) {
        //MARK: Seteamos el valor sobre la variable global del archivo .swift
        dato = txtNombre.text!
    }
    //MARK: Nuestros eventos
    @IBAction func onAceptar(_ sender: Any) {
        
        lblNombre.sizeToFit()
        var textovalidacion = ""
        if eresEstudiante.isOn {
            textovalidacion = "Eres estudiante"
        }else{
            textovalidacion = "No eres estudiante"
        }
        lblEstudiante.text = "\(textovalidacion)"
        lblNombre.text = "Hola \(txtNombre.text!)"
        
        
    }
    
    @IBOutlet weak var lblEstudiante: UILabel!
    
    //MARK: Carga del ciclo de vida del ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        self.txtNombre.delegate = self
        txtNombre.becomeFirstResponder()
    }
    
    //MARK: Mètodos delegados del UITextField
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "vistaDos" {
            if txtNombre.text == "" {
                let alerta = UIAlertController(title: "No seas wey", message: "Captura un nombre", preferredStyle: .alert)
                alerta.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: {_ in
                    print("se ha dado en un ok")
                }))
                self.present(alerta, animated: true, completion: nil)
                
                return false
            }else {
                return true
            }
        }
        return false
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "vistaDos" {
            if let destino = segue.destination as? SegundaViewController {
                //destino.dato2 = txtNombre.text!
                destino.dato3 = txtNombre.text!
            }
            
        }
    }
    
}

