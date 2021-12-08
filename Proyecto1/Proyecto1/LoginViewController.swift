//
//  LoginViewController.swift
//  Proyecto1
//
//  Created by MTWDM301-2021 on 03/12/21.
//

import UIKit
import FirebaseCore
import FirebaseFirestore

class LoginViewController: UIViewController {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var plist = UserDefaults.standard
    let database = Firestore.firestore()
    var list = [Usuarios]()
    var usuario : String = ""
    var password : String = ""

    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    
    
    
    @IBAction func onRegistrar(_ sender: Any) {
        
    }
    @IBAction func onLogin(_ sender: Any) {
        let user:String = txtUser.text!
        let pass:String = txtPass.text!
        
        //saveData(user: user, pass: pass)
        getData(user: user, pass: pass)
    }
    
    func saveData(user: String, pass: String) {
        let docRef = database.collection("maestros").document(user)
        docRef.setData([
            "user": user as Any,
            "pass": pass
        ])
    }
    
    func getData(user: String, pass: String) {
        print("Datos recibidos en el constructor, User: \(user), Pass: \(pass)")
        //let coleccion = database.collection("maestros")
        //let datos = coleccion.whereField("user", isEqualTo: user)
        database.collection("maestros").document(user).getDocument() { snapshot, error in
            if let document = snapshot, error == nil {
                if let user = document.get("user") as? String {
                    self.usuario = user
                }
                if let pass = document.get("pass") as? String {
                    self.password = pass
                }else{
                    //MARK: Crear una alerta
                    let alerta = UIAlertController(title: "Inicio de sesión", message: "No se pudo iniciar sesion, verifica usuario y contraseña", preferredStyle: .alert)
                    //MARK: Crear accion para la alerta
                    alerta.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: {
                            (UIAlertAction) in print("Alerta sesin fallida, Usuario: \(user), Pass: \(pass)")
                        }))
                            
                    //MARK: Presentar alerta
                    self.present(alerta, animated: true, completion: nil)
                }
                
            }
            
        }
        if usuario == user && password == pass {
            plist.set(usuario, forKey: "usuario")
            appDelegate.OnLoginSuccess()
            //MARK: Crear una alerta
            let alerta = UIAlertController(title: "Inicio de sesión", message: "Inicio de sesion exitoso", preferredStyle: .alert)
            //MARK: Crear accion para la alerta
            alerta.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: {
                    (UIAlertAction) in print("Usuario: \(user), Pass: \(pass)")
                }))
                    
            //MARK: Presentar alerta
            present(alerta, animated: true, completion: nil)
        }else {
            //MARK: Crear una alerta
            let alerta = UIAlertController(title: "Inicio de sesión", message: "No se pudo iniciar sesion, verifica usuario y contraseña", preferredStyle: .alert)
            //MARK: Crear accion para la alerta
            alerta.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: {
                    (UIAlertAction) in print("Usuario: \(user), Pass: \(pass)")
                }))
                    
            //MARK: Presentar alerta
            present(alerta, animated: true, completion: nil)
        }
        //print("Usuarios: \(Usuarios)")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
