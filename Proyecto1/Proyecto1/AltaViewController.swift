//
//  AltaViewController.swift
//  Proyecto1
//
//  Created by MTWDM301-2021 on 08/12/21.
//

import UIKit
import FirebaseCore
import FirebaseFirestore

class AltaViewController: UIViewController {
    let database = Firestore.firestore()
    var plist = UserDefaults.standard
    //singleton
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    @IBOutlet weak var txtPass2: TextFieldInput!
    @IBOutlet weak var txtNombre: TextFieldInput!
    @IBOutlet weak var txtPass: TextFieldInput!
    @IBOutlet weak var txtUsuario: TextFieldInput!
    @IBOutlet weak var txtCorreo: TextFieldInput!
    
    
    @IBAction func onAgregar(_ sender: Any) {
        let user = txtUsuario.text!
        let nombre = txtNombre.text!
        let correo = txtCorreo.text!
        let pass = txtPass.text!
        let pass2 = txtPass2.text!
        
        if nombre == "" || correo == "" || pass == "" || user == "" {
            //MARK: Crear una alerta
            let alerta = UIAlertController(title: "Campos obligatorios", message: "Favor de llenar todos los campos", preferredStyle: .alert)
            //MARK: Crear accion para la alerta
            alerta.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: {
                    (UIAlertAction) in //print("Usuario: \(user), Pass: \(pass)")
            }))
            //MARK: Presentar alerta
            present(alerta, animated: true, completion: nil)
        } else {
            if pass == pass2 {
                saveData(user: user, pass: pass, name: nombre, email: correo)
            }else{
                //MARK: Crear una alerta
                let alerta = UIAlertController(title: "Contraseñas no coinciden", message: "Favor de verificar su contraseña", preferredStyle: .alert)
                //MARK: Crear accion para la alerta
                alerta.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: {
                        (UIAlertAction) in //print("Usuario: \(user), Pass: \(pass)")
                }))
                //MARK: Presentar alerta
                present(alerta, animated: true, completion: nil)
            }
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func saveData(user: String, pass: String, name: String, email: String) {
        let docRef = database.collection("maestros").document(user)
        docRef.setData([
            "user": user as Any,
            "pass": pass,
            "name": name,
            "email": email
            
        ])
        //MARK: Crear una alerta
        let alerta = UIAlertController(title: "Usuario agregado", message: "El usuario se agrego corrrectamente", preferredStyle: .alert)
        //MARK: Crear accion para la alerta
        alerta.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: {
                (UIAlertAction) in print("Usuario: \(user), Pass: \(pass)")
            self.txtUsuario.text = ""
            self.txtNombre.text = ""
            self.txtPass.text = ""
            self.txtCorreo.text = ""
            self.txtPass2.text = ""
            }))
                
        //MARK: Presentar alerta
        present(alerta, animated: true, completion: nil)
    }
    

}
