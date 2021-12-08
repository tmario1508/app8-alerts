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
    var list = [Usuarios]()

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
        database.collection("maestros").document(user).getDocument() { snapshot, error in
            if let document = snapshot, error == nil {
                if let user = document.get("user") as? String {
                    self.txtUser.text = user
                }
                if let pass = document.get("pass") as? String {
                    self.txtPass.text = pass
                }
            }
            
            /*
            // Check for errors
            if error == nil {
                // No errors
                
                if let snapshot = snapshot {
                    
                    // Update the list property in the main thread
                    DispatchQueue.main.async {
                        
                        // Get all the documents and create Todos
                        self.list = snapshot.documents.map { d in
                            //let entidad = EntidadUsuario(user: d["user"] as? String, pass: d["pass"] as? String)
                            // Create a Todo item for each document returned
                            return Usuarios(id: d.documentID,
                                        user: d["user"] as? String ?? "",
                                        pass: d["pass"] as? String ?? "")
                        }
                    }
                    
                    
                }
            }
            else {
                // Handle the error
            }*/
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
