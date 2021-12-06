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
    let database = Firestore.firestore()
    

    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    
    @IBAction func onLogin(_ sender: Any) {
        let user:String = txtUser.text!
        let pass:String = txtPass.text!
        
        //saveData(user: user, pass: pass)
        getData(user: user)
    }
    
    func saveData(user: String, pass: String) {
        let docRef = database.collection("maestros").document(user)
        docRef.setData([
            "user": user as Any,
            "pass": pass
        ])
    }
    
    func getData(user: String) {
        let coleccion = database.collection("maestros")
        let datos = coleccion.whereField("user", isEqualTo: user)
        txtPass.text = datos.data()
        database.collection("maestros").whereField("user", isEqualTo: user).getDocuments() { (datos, err) in
            if let err = err {
                print("Error al cargar los datos: \(err)")
            }else{
                let usuarios = datos
                print("Usuarios: \(usuarios)")
            }
        }
        
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
